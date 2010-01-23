class CreateExpenseReports < ActiveRecord::Migration
  def self.up
    create_table :expense_reports do |t|
    end
  end

  def self.down
    drop_table :expense_reports
  end
end
