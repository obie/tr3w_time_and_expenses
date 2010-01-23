# == Schema Information
#
# Table name: contact_cards
#
#  id           :integer(11)   not null, primary key
#  client_id    :integer(11)   
#  contact_id   :integer(11)   
#  contact_type :string(255)   
#

class ContactCard < ActiveRecord::Base
  belongs_to :client
  belongs_to :contact, :polymorphic => true
end
