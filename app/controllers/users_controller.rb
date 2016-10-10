class UsersController < ApplicationController
  def show
    @review = Review.new
    @user = User.find(params[:id])
  end

  def myeventsandrequests
    @user = current_user
    @events = Event.where("user_id = ? AND start_date > ?", @user.id, Date.today)
  end

end
