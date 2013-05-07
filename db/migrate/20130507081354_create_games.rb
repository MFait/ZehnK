class CreateGames < ActiveRecord::Migration

  def up
    create_table :games do |column|
      column.string :table_set
      column.timestamps
    end
  end

  def down
    drop_table :games
  end
end
