require "sinatra/activerecord"

class Action < ActiveRecord::Base
  #self.table_name = :actions
  belongs_to :player
end