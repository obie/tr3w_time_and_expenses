require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase

  fixtures :timesheets, :users

  def test_only_authorized_user_may_be_associated_as_approver
    sheet = Timesheet.create
    sheet.approver = users(:approver)
    assert sheet.save
    assert_not_nil sheet.approver(true), "approver assignment failed"
  end

  def test_non_authorized_user_cannot_be_associated_as_approver
    sheet = Timesheet.create
    begin
      sheet.approver = users(:joe)
      flunk "approver assignment should have failed"
    rescue UnauthorizedApproverException
      # expected
    end
  end

  def test_optimistic_locking_behavior
    first_instance = Timesheet.find(1)
    second_instance = Timesheet.find(1)

    first_instance.approver = users(:approver)
    second_instance.approver = users(:approver2)

    assert first_instance.save, "First instance save succeeded"

    assert_raises ActiveRecord::StaleObjectError do
      second_instance.save
    end
  end

end
