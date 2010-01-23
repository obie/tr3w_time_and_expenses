require File.dirname(__FILE__) + '/../spec_helper'

context "Having loaded clients fixtures..." do
  fixtures :clients

  specify "There should be two Clients" do
    Client.count.should_be 2
  end

  specify "Client One should be findable by its code C1" do
    Client.find_by_code("C1").name.should == "Client One"
  end
end
