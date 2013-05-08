require "sinatra/activerecord"

class Player < ActiveRecord::Base
  belongs_to :game
  has_many :actions
end