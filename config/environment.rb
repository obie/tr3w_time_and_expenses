# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when 
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '1.1.6'

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Skip frameworks you're not going to use
  config.frameworks -= [ :action_web_service ]

  # Make Active Record use UTC-base instead of local time
  config.active_record.default_timezone = :utc
  
  config.action_controller.session_store = :active_record_store
  
  # See Rails::Configuration for more options
end

# Include your application configuration below
ExceptionNotifier.exception_recipients = %w( jhubert@gmail.com )

require 'fixture_helpers'