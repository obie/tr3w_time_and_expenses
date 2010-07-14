require 'test_helper'

class LateNoticeTest < ActiveSupport::TestCase
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"

  # include ActionMailer::Quoting

  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @expected = Mail.new
    @expected.content_type "text/plain;charset=#{CHARSET}"
    @expected.mime_version = '1.0'
  end

  def test_nothing
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/late_notice/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
