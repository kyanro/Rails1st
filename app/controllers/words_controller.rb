class WordsController < ApplicationController
	skip_before_filter :verify_authenticity_token ,:only=>[:getmorning, :getmorning2]

	def index
		@words = Word.all
	end
	def getmorning
		searchdWord   = Word.getSearchedWord(params[:time], params[:emotion], params[:character_id])
		setTime       = Word.toResponseTimeString(params[:time])
		@responseWord = "#{setTime} #{searchdWord}"
	end

	#
	#= 嫉妬される男の喜び
	#
	def getmorning2
		jealousyWord  = Word.getJealousyWord(params[:emotion])
		setTime       = Word.toResponseTimeString(params[:time])
		@responseWord = "#{setTime} #{jealousyWord}"
	end
end