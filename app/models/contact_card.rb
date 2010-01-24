class ContactCard < ActiveRecord::Base
  belongs_to :client
  belongs_to :contact, :polymorphic => true
end
