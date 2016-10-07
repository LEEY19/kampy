class WelcomeController < ApplicationController

  def home
    @reviews = Review.all
    @users = User.all
  end
  
end
