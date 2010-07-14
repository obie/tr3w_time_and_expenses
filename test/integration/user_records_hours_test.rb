require "test_helper"

class UserRecordsHoursTest < ActionController::IntegrationTest

  fixtures :users, :billable_weeks, :billing_codes, :clients, :timesheets

  def setup
    @dblack = users(:david)
  end

  def test_login
    logged_in("dblack", "test") do |user|
      post("timesheets/create")
      assert_response(:redirect)
      follow_redirect!
      assert_template("timesheets/show")
      timesheet = Timesheet.find(:all)[-1]
      assert_equal(user,timesheet.user)

      post("billable_weeks/add_to_timesheet",
        :timesheet_id => timesheet.id,
        :date => { :year => 2010, :month => 7, :day => 14 },
        :billable_week => {
        :client_id => 3,
        :start_date => "December 4 2006",
        :billing_code_id => 3,
        :monday_hours => 8,
        :tuesday_hours => 7.5,
        :wednesday_hours => 0,
        :thursday_hours => 8.25,
        :friday_hours => 6.5 
        })
      assert_response(:redirect)
      follow_redirect!
      assert_template("timesheets/show")
    end
  end
end
