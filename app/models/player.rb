class Player < ActiveRecord::Base
  has_many :positions
  has_many :teams, :through => :positions
end