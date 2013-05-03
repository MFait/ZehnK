class CreatePlayers < ActiveRecord::Migration
  def up
    create_table :players do |column|
      column.string :name
      column.integer :score
    end
  end

  def down
    drop_table :players
  end
end
