class WordsController < ApplicationController
	skip_before_filter :verify_authenticity_token ,:only=>[:getmorning]


	def index
		@words = Word.all
	end
	def getmorning
		@words = Word.all
	end
end