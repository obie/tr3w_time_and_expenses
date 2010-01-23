# == Schema Information
#
# Table name: comments
#
#  id         :integer(11)   not null, primary key
#  subject    :string(255)   
#  body       :text          
#  created_at :datetime      
#

class Comment < ActiveRecord::Base
  belongs_to :subject, :polymorphic => true
end
