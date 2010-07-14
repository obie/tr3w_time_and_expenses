require File.expand_path('../boot', __FILE__)

module TimeAndExpenses
  class Application < Rails::Application
    require 'rack/contrib'
    config.middleware.use 'Rack::JSONP'

    config.action_dispatch.session_store = :active_record_store
    config.secret_token = "some secret phrase of at least 30 characters"
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end

# Include your application configuration below
# ExceptionNotifier.exception_recipients = %w( jhubert@gmail.com )

require 'factory_girl_rails'
require 'rspec-rails'
