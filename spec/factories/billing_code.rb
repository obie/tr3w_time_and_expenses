# == Schema Information
#
# Table name: billing_codes
#
#  id          :integer(11)   not null, primary key
#  client_id   :integer(11)   
#  code        :string(255)   
#  description :text          
#

Factory.define(:billing_code) do |f|
  f.code { File.read(Rails.root.join('README')).scan(/[\w']+/).rand.upcase }
  f.description "this is a description"
end