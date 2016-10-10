class WelcomeController < ApplicationController

  def home
    @reviews = Review.all
    @events = Event.all
    @users = User.all
  end
  
end
