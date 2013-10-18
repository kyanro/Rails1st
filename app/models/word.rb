require 'date'
class Word < ActiveRecord::Base
	def self.getTimeFromDateTime(time)
		return DateTime.parse(time).strftime("2000-01-01 %H:%M")
	end

	#
	#= 渡された時間をもとに規定の形式の文字列型の時間を返却する
	#	現在の既定は %-m月%-d日 %k時%M分
	def self.toResponseTimeString(time)
		return DateTime.parse(time).strftime("%-m月%-d日 %k時%M分")
	end

end
