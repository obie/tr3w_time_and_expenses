class AddLockVersionToTimesheets < ActiveRecord::Migration
  def self.up
    add_column :timesheets, :lock_version, :integer, :default => 0
  end

  def self.down
    remove_column :timesheets, :lock_version
  end
end
