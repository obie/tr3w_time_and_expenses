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

Factory.define(:timesheet) do |f|
  f.submitted false
  f.association :user
  f.billable_weeks { [Factory(:billable_week), Factory(:billable_week)]  }
end