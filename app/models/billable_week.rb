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
