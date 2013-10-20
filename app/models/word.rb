require 'date'
require 'net/http'
require 'uri'
require 'json'

class Word < ActiveRecord::Base
	#
	#= 受け取ったDatetime文字列を "2000-01-01 %H:%M:00" のDatetime型として返却する
	# time型の列の検索をactive record で利用するために作成
	# sqliteの場合、単なる文字列との比較となるので、
	# grater then を正確にきかせるために、.000000 までつける
	#
	def self.getTimeFromDateTimeString(time)
		return DateTime.parse(time).strftime("2000-01-01 %H:%M:00.000000")
	end

	#
	#= 渡された時間をもとに規定の形式の文字列型の時間を返却する
	#	現在の既定は %-m月%-d日 %k時%M分
	def self.toResponseTimeString(time)
		return DateTime.parse(time).strftime("%-m月%-d日 %-k時%M分")
	end

	#
	#= 渡されたstring型の時間,int型のemotion,int型のcharacter_idをもとにWordsDBを検索し、	最適なstring型のWordを返却する
	#
	def self.getSearchedWord(time, emotion, character_id)
		# 初期値とりあえず1
		character_id ||= 1
		searchedWord = 
				 where(["character_id = ?", character_id])
				.where(["since <= ?", self.getTimeFromDateTimeString(time)])
				.where(["until >= ?", self.getTimeFromDateTimeString(time)])
				.where(["emotion_lower_limit <= ?", emotion])
				.where(["emotion_upper_limit >= ?", emotion])
				.sample
		if (searchedWord == nil) then
			return "ですね。分かりました。"
		else
			return searchedWord[:word]
		end
	end

	#
	#= 嫉妬される男の喜び
	# ところであなたの検索履歴に 美人 name ってあったけど、私に不満でも？
	#
	def self.getJealousyWord(emotion)
		uri = URI.parse('http://bjin.me/api/?type=rand&count=1&format=json')
		json = Net::HTTP.get(uri)
		result = JSON.parse(json)

		return "ところであなたの検索履歴に 美人 #{result[0]["category"]} ってあったけど、私に不満でも？"
	end
end
