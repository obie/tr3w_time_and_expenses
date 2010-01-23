class Team < ActiveRecord::Base
  has_many :positions
  has_many :players, :through => :positions
  
  def players=(players_hash)
    players_hash.keys.each do |role|
      positions.create(:role => role, :player => Player.new(players_hash[role]))
    end
  end

end
