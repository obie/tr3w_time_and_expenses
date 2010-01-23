# == Schema Information
#
# Table name: timesheets
#
#  id           :integer(11)   not null, primary key
#  submitted    :boolean(1)    
#  user_id      :integer(11)   
#  updated_at   :datetime      
#  created_at   :datetime      
#  approver_id  :integer(11)   
#  lock_version :integer(11)   default(0)
#

class Timesheet < ActiveRecord::Base
  belongs_to :approver,
             :class_name => 'User',
             :foreign_key => 'approver_id',
             :conditions => ['authorized_approver = ?', true],
             :extend => CheckApproverExtension
  
  belongs_to :user
  
  has_many :billable_weeks, :include => [:billing_code]

  def self.billable_hours_outstanding_for(user)
    user.timesheets.map(&:billable_hours_outstanding).sum
  end

  def billable_hours_outstanding
    submitted? ? billable_weeks.map(&:total_hours).sum : 0
  end
end

class UnauthorizedApproverException < Exception
end
