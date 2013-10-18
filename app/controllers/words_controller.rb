class WordsController < ApplicationController
	skip_before_filter :verify_authenticity_token ,:only=>[:getmorning]

	def index
		@words = Word.all
	end
	def getmorning
		searchdWord   = Word.getSearchedWord(params[:time],params[:emotion])
		setTime       = Word.toResponseTimeString(params[:time])
		@responseWord = setTime + searchdWord 
	end
end