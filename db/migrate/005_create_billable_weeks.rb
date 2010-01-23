class CreateBillableWeeks < ActiveRecord::Migration
  def self.up
    create_table :billable_weeks do |t|
      t.column :timesheet_id, :integer
      t.column :client_id, :integer
      t.column :start_date, :datetime
      t.column :billing_code_id, :integer
      t.column :monday_hours, :integer
      t.column :tuesday_hours, :integer
      t.column :wednesday_hours, :integer
      t.column :thursday_hours, :integer
      t.column :friday_hours, :integer
      t.column :saturday_hours, :integer
      t.column :sunday_hours, :integer
    end
  end

  def self.down
    drop_table :billable_weeks
  end
end
