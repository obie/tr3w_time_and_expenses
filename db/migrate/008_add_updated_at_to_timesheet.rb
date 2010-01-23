class AddUpdatedAtToTimesheet < ActiveRecord::Migration
  def self.up
    add_column :timesheets, :updated_at, :datetime
    add_column :timesheets, :created_at, :datetime
  end

  def self.down
    remove_column :timesheets, :updated_at
    remove_column :timesheets, :created_at
  end
end
