class CreateContactCards < ActiveRecord::Migration
  def self.up
    create_table :contact_cards do |t|
      t.column :client_id, :integer
      t.column :contact_id, :integer
      t.column :contact_type, :string
    end
  end

  def self.down
    drop_table :contact_cards
  end
end
