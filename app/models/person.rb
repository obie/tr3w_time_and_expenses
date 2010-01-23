# == Schema Information
#
# Table name: people
#
#  id :integer(11)   not null, primary key
#

class Person < ActiveRecord::Base
  has_many :contact_cards, :as => :contact
end
