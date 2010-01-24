require File.expand_path('../boot', __FILE__)

module TimeAndExpenses
  class Application < Rails::Application
    config.action_controller.session_store = :active_record_store
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end

# Include your application configuration below
# ExceptionNotifier.exception_recipients = %w( jhubert@gmail.com )

require 'factory_girl'
