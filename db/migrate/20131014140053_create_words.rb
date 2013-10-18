class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :character_id
      t.integer :emotion
      t.string :word
      t.time :since
      t.time :until
      t.boolean :seed

      t.timestamps
    end
  end
end
