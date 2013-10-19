class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :character_id
      t.integer :emotion_lower_limit
      t.integer :emotion_upper_limit
      t.time :since
      t.time :until
      t.string :word
      t.boolean :seed

      t.timestamps
    end
  end
end
