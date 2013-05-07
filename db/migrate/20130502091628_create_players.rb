class CreatePlayers < ActiveRecord::Migration

  def up
    create_table :players do |column|
      column.integer :game_id
      column.string :name
      column.string :pocket_set
      column.integer :pocket_score
      column.integer :bank_amount
      column.timestamps
    end
  end

  def down
    drop_table :players
  end
end
