require 'spec_helper'

describe User do
  subject do
    Factory.build(:user)
  end

  it "should create a new instance given valid attributes" do
    should be_valid
  end
end
