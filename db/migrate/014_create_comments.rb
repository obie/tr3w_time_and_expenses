class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.references :subject, :polymorphic => true

      # references can be used as a shortcut for following two statements
      # t.integer :subject_id
      # t.string  :subject_type 

      t.timestamps
    end
    
  end

  def self.down
    drop_table :comments
  end
end
