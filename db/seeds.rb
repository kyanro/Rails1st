# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

#
#= Seedで追加したWordのレコードをすべて削除
#
Word
	.where(seed: true)
	.delete_all

#
#= 初期データの投入
# default.tsv の投入。encordは Excelのunicode保存にあわせて、
# BOM付きUTF-16LE 固定とした 
#
options = {encoding:"BOM|UTF-16LE", col_sep: "\t", headers: :first_row}
CSV.foreach('db/seeds/default.tsv', options){|r|
	Word.create(
		character_id:        r["character_id"],
		emotion_lower_limit: r["emotion_lower_limit"],
		emotion_upper_limit: r["emotion_upper_limit"],
		word:                r["word"],
		since:               r["since"],
		until:               r["until"],
		seed:                true
	)
}
