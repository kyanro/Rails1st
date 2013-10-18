require 'date'
class Word < ActiveRecord::Base
	def self.getTimeFromDateTime(time)
		return DateTime.parse(time).strftime("2000-01-01 %H:%M")
	end
end
