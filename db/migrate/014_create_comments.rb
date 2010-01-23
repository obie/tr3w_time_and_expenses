class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :subject,    :string
      t.column :body,       :text
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :comments
  end
end
