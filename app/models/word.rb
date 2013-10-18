require 'date'
class Word < ActiveRecord::Base
	#
	#= 受け取ったDatetime文字列を "2000-01-01 %H:%M:00" のDatetime型として返却する
	# time型の列の検索をactive record で利用するために作成
	#
	def self.getTimeFromDateTimeString(time)
		return DateTime.parse(DateTime.parse(time).strftime("2000-01-01 %H:%M"))
	end

	#
	#= 渡された時間をもとに規定の形式の文字列型の時間を返却する
	#	現在の既定は %-m月%-d日 %k時%M分
	def self.toResponseTimeString(time)
		return DateTime.parse(time).strftime("%-m月%-d日 %-k時%M分")
	end

	#
	#= 渡されたstring型の時間をもとにWordsDBを検索し、最適なstring型のWordを返却する
	#
	def self.getSearchedWord(time)
		searchedWord = 
				 where(["since < ?", self.getTimeFromDateTimeString(time)])
				.where(["until > ?", self.getTimeFromDateTimeString(time)])
				.first

		if (searchedWord == nil) then
			return "ですね。分かりました。"
		else
			return searchedWord[:word]
		end
	end
end
