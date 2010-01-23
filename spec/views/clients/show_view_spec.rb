require File.dirname(__FILE__) + "/../../spec_helper.rb"

context "When showing a client" do
  
  setup do
    assigns[:client] = Client.new(:name => 'Client One')
    render "/clients/show"
  end
  
  specify "display name" do
    response.should_have_tag :div, :attributes => { :class => 'client'} #do |div|
      #div.should_have_tag :span, :attributes => { :class => 'name'}, :content => 'Client One'
      response.should_have_tag :span, :attributes => { :class => 'name'}, :content => 'Client One'
    #end
  end
end