class AddClientIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :client_id, :integer
  end

  def self.down
    remove_column :users, :client_id
  end
end
