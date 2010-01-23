namespace :rails do
  desc "Configure Subversion for Rails"
  task :configure_for_svn do
    system "svn propset svn:ignore -R '.DS_Store' . --force"
    system "svn update"
    system "svn commit -m 'ignore all .DS_Store files'"
    system "svn remove log/* --force"
    system "svn commit -m 'removing all log files from subversion'"
    system "svn propset svn:ignore '*.log' log/ --force"
    system "svn update log/"
    system "svn commit -m 'Ignoring all files in /log/ ending in .log'"
    system "svn propset svn:ignore '*' tmp/sessions tmp/cache tmp/sockets"
    system "svn commit -m 'Ignoring all files in /tmp/'"
    system "svn propset svn:ignore '*.db' db/ --force"
    system "svn update db/"
    system "svn commit -m 'Ignoring all files in /db/ ending in .db'"
    system "svn move config/database.yml config/database.example --force"
    system "svn commit -m 'Moving database.yml to database.example to provide a template for anyone who checks out the code'"
    system 'svn propset svn:ignore "locomotive.yml\ndatabase.yml" config/ --force'
    system "svn update config/"
    system "svn commit -m 'Ignoring locomotive.yml and database.yml'"
    system "script/plugin install -x http://dev.rubyonrails.org/svn/rails/plugins/exception_notification/"
    system "script/plugin install -x http://svn.techno-weenie.net/projects/plugins/acts_as_attachment/"
    system "script/plugin install -x http://svn.techno-weenie.net/projects/plugins/resource_generator/"
    system "script/plugin install -x http://svn.techno-weenie.net/projects/plugins/labeled_form_helper/"
    system "script/plugin install -x http://svn.techno-weenie.net/projects/plugins/acts_as_authenticated/"
  end
end

namespace :svn do
  task :st do
    puts %x[svn st]
  end

  task :up do
    puts %x[svn up]
  end

  task :add do
    %x[svn st].split(/\n/).each do |line|
      trimmed_line = line.delete('?').lstrip
      if line[0,1] =~ /\?/
        %x[svn add #{trimmed_line}]
        puts %[added #{trimmed_line}]
      end
    end
  end
  
  task :delete do
    %x[svn st].split(/\n/).each do |line|
      trimmed_line = line.delete('!').lstrip
      if line[0,1] =~ /\!/
        %x[svn rm #{trimmed_line}]
        puts %[removed #{trimmed_line}]
      end
    end
  end
end

desc "Run before checking in"
task :pc => ['svn:add', 'svn:delete', 'svn:up', :default, 'svn:st']