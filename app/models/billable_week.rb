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

class BillableWeek < ActiveRecord::Base
  belongs_to :client
  belongs_to :billing_code
  belongs_to :timesheet

  validates_presence_of :start_date

  def total_hours
    %w{ mon tues wednes thurs fri satur sun }.inject(0) do |acc,day|
      acc + send("#{day}day_hours").to_i
    end
  end
end
