# == Schema Information
#
# Table name: businesses
#
#  id :integer(11)   not null, primary key
#

class Business < ActiveRecord::Base
  has_many :contact_cards, :as => :contact
end
