class CreateActions < ActiveRecord::Migration

  def up
    create_table :actions do |column|
      column.integer :player_id
      column.string :name
      column.timestamps
    end
  end

  def down
    drop_table :actions
  end

end
