require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    alpha = ('a'..'z').to_a
    @letters = alpha.sample(10)
  end

  def score
    @array = params[:select].split(' ')
    @word_answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{@word_answer}"
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)
  end
end
