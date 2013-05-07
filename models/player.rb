require "sinatra/activerecord"

class Player < ActiveRecord::Base
  #self.table_name = :players
  belongs_to :game
  has_many :actions
end