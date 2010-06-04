class AddSpendToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :total_spend, :integer
    add_column :clients, :hottest_spend_day, :integer
  end

  def self.down
    remove_column :clients, :total_spend, :integer
    remove_column :clients, :hottest_spend_day, :integer
  end
end
