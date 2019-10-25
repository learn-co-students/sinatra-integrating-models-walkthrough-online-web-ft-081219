require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'
require 'pry'
class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @wordCount = @analyzed_text.count_of_words
    @vowelCount = @analyzed_text.count_of_vowels
    @consonatCount = @analyzed_text.count_of_consonants
    @mostUsedLetter = @analyzed_text.most_used_letter
    #binding.pry 
    erb :results
  end
end
