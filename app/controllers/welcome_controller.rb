class WelcomeController < ApplicationController

  def home
    @reviews = Review.all
    @events = Event.all.order(created_at: :desc)
    @users = User.all
  end

end
