require 'spec_helper'

describe Client do
  before do
    Factory(:client)
    Factory(:client, :code => "C1", :name => "Client One")
  end

  specify "There should be two Clients" do
    Client.count.should == 2
  end

  specify "Client One should be findable by its code C1" do
    Client.find_by_code("C1").name.should == "Client One"
  end
end
