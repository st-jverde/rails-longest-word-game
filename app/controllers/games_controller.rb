require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @input = params[:word]
    if english_word?(@input)
      @answer = "Congratulations! #{@input} is an English word"
    # elsif
    #   return @incorrect_combination
    else
      @answer = 'Sorry wrong answer'
    end
  end

  private

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url).read
    result = JSON.parse(response)
    result['found']
  end

  def included?
    @letters { |letter| letter.count(letter) <= letter.count(letter) }
  end

end
