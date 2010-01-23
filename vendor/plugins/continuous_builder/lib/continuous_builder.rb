require File.dirname(__FILE__) + '/marshmallow'

module ContinuousBuilder
  class Build
    attr_reader :output, :success, :checkout, :status

    def initialize(options = {})
      @options  = options
      @status   = Status.new(log_file_path)
      @checkout = Checkout.new(options)
    end
 
    def run
      under_lock do
        checkout.update!
        previous_status = @status.recall
      
        if checkout.has_changes?
          if status = make
            @status.keep(:succesful)
            previous_status == :failed ? :revived : :succesful
          else
            @status.keep(:failed)
            previous_status == :failed ? :broken : :failed
          end
        else
          :unchanged
        end
      end
    end
 
    private
      def log_file_path
        @log_file_path ||= @options[:application_root] + "/log/last_build.log"
      end
    
      def lock_file_path
        @lock_file ||= File.join(@options[:application_root], 'tmp', 'pids', 'continuous_builder.pid')
      end
    
      def make
        @output = `cd #{@options[:application_root]} && #{@options[:bin_path]}rake #{@options[:task_name]} RAILS_ENV=test`
        make_successful?
      end
      
      def make_successful?
        $?.exitstatus == 0
      end
      
      def under_lock
        wait_for_lock

        begin
          grab_lock
          yield
        ensure
          File.delete(lock_file_path)
        end
      end
      
      def wait_for_lock
        begin
          Timeout::timeout(600) do # timeout after 10 minutes
            while File.exists?(lock_file_path)
              sleep(10) # check back after 10 seconds
            end
          end
        rescue Timeout::Error
          exit(1) # abort build
        end
      end
      
      def grab_lock
        File.open(lock_file_path, 'w') { |f| f << $$ }
      end
      
      def release_lock
        File.delete(lock_file_path)
      end
  end
  
  class Checkout
    def initialize(path, options = {})
      @path, @options = path, options
    end

    def update!
      @status = execute("svn update")
    end

    def has_changes?
      @status =~ /[A-Z]\s+[\w\/]+/
    end

    def current_revision
      info['Revision'].to_i
    end
 
    def url
      info['URL']
    end
 
    def last_commit_message
      execute("svn log", " -rHEAD -v")
    end
 
    def last_author
      info['Last Changed Author'].capitalize
    end

    private
      def info
        @info ||= YAML.load(execute("svn info"))
      end
      
      def execute(command, parameters = nil)
        `#{@options[:env_command]}#{command} #{@options[:application_root]} #{parameters}`
      end
  end

  class Status
    def initialize(path)
      @path = path
    end
    
    def keep(status)
      File.open(@path, "w+", 0777) { |file| file.write(status.to_s) }
    end
    
    def recall
      value = File.exists?(@path) ? File.read(@path) : false
      value.blank? ? false : value.to_sym
    end
  end

  class MailNotifier < ActionMailer::Base
    def failure(build, options, sent_at = Time.now)
      @subject = "[#{options[:application_name]}] Build broken by #{build.checkout.last_author} (##{build.checkout.current_revision})"
      @body    = [ build.checkout.last_commit_message, build.output ].join("\n\n")

      @recipients, @from, @sent_on = options[:recipients], options[:sender], sent_at
    end
    
    def broken(build, options, sent_at = Time.now)
      @subject = "[#{options[:application_name]}] Build still broken (##{build.checkout.current_revision})"
      @body    = [ build.checkout.last_commit_message, build.output ].join("\n\n")

      @recipients, @from, @sent_on = options[:recipients], options[:sender], sent_at
    end
    
    def revival(build, options, sent_at = Time.now)
      @subject = "[#{options[:application_name]}] Build fixed by #{build.checkout.last_author} (##{build.checkout.current_revision})"
      @body    = [ build.checkout.last_commit_message ].join("\n\n")

      @recipients, @from, @sent_on = options[:recipients], options[:sender], sent_at
    end
  end
  
  module CampfireNotifier
    extend self
    
    def deliver_failure(build, options)
      deliver(options[:campfire_url], "#{build.checkout.last_author} broke #{application(options)} with #{changeset(options, build)}", build.output)
    end
    
    def deliver_broken(build, options)
      deliver(options[:campfire_url], "#{build.checkout.last_author} didn't fix #{application(options)} with #{changeset(options, build)}", build.output)
    end
    
    def deliver_revival(build, options)
      deliver(options[:campfire_url], "#{build.checkout.last_author} fixed #{application(options)} with #{changeset(options, build)}")
    end
    
    private
      def application(options)
        options[:application_name].capitalize
      end
    
      def changeset(options, build)
        options[:changeset_url] + build.checkout.current_revision.to_s
      end
    
      def deliver(to, subject, output = nil)
        Marshmallow.say(to, subject)
        Marshmallow.paste(to, output) unless output.nil?
      end
  end
end