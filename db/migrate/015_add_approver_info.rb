class AddApproverInfo < ActiveRecord::Migration
  def self.up
    add_column :timesheets, :approver_id, :integer
    add_column :users, :authorized_approver, :boolean
  end

  def self.down
    remove_column :timesheets, :approver_id
    remove_column :users, :authorized_approver
  end
end
