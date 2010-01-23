desc "Pull latest revision, run unit and functional tests, send email on errors"
task :test_latest_revision => :environment do
  require(File.dirname(__FILE__) + "/../lib/continuous_builder")

  build = ContinuousBuilder::Build.new(
    :task_name        => ENV['RAKE_TASK'] || '',
    :bin_path         => ENV['BIN_PATH']  || "/usr/local/bin/",
    :application_root => RAILS_ROOT
  )

  mail_notice_options = {
    :application_name => ENV['NAME'], 
    :recipients       => ENV['RECIPIENTS'], 
    :sender           => ENV['SENDER'] || "'Continuous Builder' <cb@example.com>" 
  }
    
  campfire_notice_options = {
    :application_name => ENV['NAME'],
    :campfire_url     => ENV['CAMPFIRE_URL'],
    :changeset_url    => ENV['CHANGESET_URL']
  }

  case build.run
    when :failed
      ContinuousBuilder::MailNotifier.deliver_failure(build, mail_notice_options) if ENV['RECIPIENTS']
      ContinuousBuilder::CampfireNotifier.deliver_failure(build, campfire_notice_options) if ENV['CAMPFIRE_URL']
    when :revived
      ContinuousBuilder::MailNotifier.deliver_revival(build, mail_notice_options) if ENV['RECIPIENTS']
      ContinuousBuilder::CampfireNotifier.deliver_revival(build, campfire_notice_options) if ENV['CAMPFIRE_URL']
    when :broken
      ContinuousBuilder::MailNotifier.deliver_broken(build, mail_notice_options) if ENV['RECIPIENTS']
      ContinuousBuilder::CampfireNotifier.deliver_broken(build, campfire_notice_options) if ENV['CAMPFIRE_URL']
    when :unchanged, :succesful
      # Smile, be happy, it's all good
  end 
end