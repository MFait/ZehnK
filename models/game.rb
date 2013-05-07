require "sinatra/activerecord"

class Game < ActiveRecord::Base
  #self.table_name = :games
  has_many :players
end