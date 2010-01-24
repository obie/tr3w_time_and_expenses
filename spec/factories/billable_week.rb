# == Schema Information
#
# Table name: billable_weeks
#
#  id              :integer(11)   not null, primary key
#  timesheet_id    :integer(11)   
#  client_id       :integer(11)   
#  start_date      :datetime      
#  billing_code_id :integer(11)   
#  monday_hours    :integer(11)   
#  tuesday_hours   :integer(11)   
#  wednesday_hours :integer(11)   
#  thursday_hours  :integer(11)   
#  friday_hours    :integer(11)   
#  saturday_hours  :integer(11)   
#  sunday_hours    :integer(11)   
#

Factory.define(:billable_week) do |f|
  f.association :billing_code
  f.association :client
  f.start_date { 30.days.ago }
end