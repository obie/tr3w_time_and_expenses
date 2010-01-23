# == Schema Information
#
# Table name: avatars
#
#  id      :integer(11)   not null, primary key
#  user_id :integer(11)   
#  url     :string(255)   
#

class Avatar < ActiveRecord::Base
  belongs_to :user
end
