# == Schema Information
#
# Table name: expense_reports
#
#  id      :integer(11)   not null, primary key
#  user_id :integer(11)   
#

class ExpenseReport < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :subject
end
