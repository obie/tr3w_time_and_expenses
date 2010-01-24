require File.dirname(__FILE__) + '/../spec_helper'

describe BillingCode do
  it "should have a bidirectional habtm association" do
    travel_code = BillingCode.create(:code => 'TRAVEL')
    dev_code = BillingCode.create(:code => 'DEV')
    travel_code.related << dev_code
    travel_code.reload.related.should include(dev_code)
    dev_code.reload.related.should include(travel_code)
  end
end
