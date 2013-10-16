class AddRowWords < ActiveRecord::Migration
  def change
  	Word.create(character_id: "1", word: "了解しました", since: "00:00:00", until: "00:00:00")
    Word.create(character_id: "1", word: "このダメ人間が", since: "12:00:00", until: "18:00:00")
  end
end
