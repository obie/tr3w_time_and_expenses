class CreateBillingCodes < ActiveRecord::Migration
  def self.up
    create_table :billing_codes do |t|
      t.column :client_id, :integer
      t.column :code, :string
      t.column :description, :text
    end
  end

  def self.down
    drop_table :billing_codes
  end
end
