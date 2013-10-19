# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
#= Seedで追加したWordのレコードをすべて削除
#
Word
	.where(seed: true)
	.delete_all

# 初期データの投入
Word.create(character_id: "1", emotion_lower_limit: 1, emotion_upper_limit: 7, word: "・・・。そんな時間に私に起きろって？正気？", since: "00:00:00", until: "04:00:00", seed: true)
Word.create(character_id: "1", emotion_lower_limit: 1, emotion_upper_limit: 7, word: "ですね。了解しました、ご主人様。", since: "04:00:00", until: "12:00:00", seed: true)
Word.create(character_id: "1", emotion_lower_limit: 1, emotion_upper_limit: 7, word: "ですって？一体いつまで寝るつもりなの？このダメ人間！", since: "12:00:00", until: "20:00:00", seed: true)
Word.create(character_id: "1", emotion_lower_limit: 1, emotion_upper_limit: 7, word: "・・・。そろそろ眠り始める人がいてもおかしくない時間よ？", since: "20:00:00", until: "23:59:59", seed: true)
