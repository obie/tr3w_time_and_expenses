class AddTimesheetsUpdatedAtToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :timesheets_updated_at, :datetime
  end

  def self.down
    remove_column :users, :timesheets_updated_at
  end
end
