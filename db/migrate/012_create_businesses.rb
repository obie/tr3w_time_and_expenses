class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
    end
  end

  def self.down
    drop_table :businesses
  end
end
