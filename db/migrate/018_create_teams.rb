class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name, :coach
      t.timestamps 
    end
    
    create_table :positions do |t|
      t.string :role
      t.integer :team_id, :player_id
      t.timestamps
    end
    
    create_table :players do |t|
      t.string :name
      t.timestamps 
    end
  end

  def self.down
    drop_table :teams
    drop_table :positions
    drop_table :players
  end
end
