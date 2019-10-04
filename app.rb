require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    # binding.pry
    
    @count_of_words = @analyzed_text.count_of_words
    @count_of_vowels = @analyzed_text.count_of_vowels
    @count_of_consonants = @analyzed_text.count_of_consonants
    @most_used_letter = @analyzed_text.most_used_letter.keys[0].upcase
    @count_of_most_used_letter = @analyzed_text.most_used_letter.values[0]
    erb :results
  end
end
