class EventsController < ApplicationController

before_action :set_listing, only: [:show, :update, :edit, :destroy]

  def index

  end

  def new
    @event= Event.new
    @user = User.new # To delete later - DEV

  end

  def create
    @event = current_user.events.new(event_params)

      if @event.save(validate: false)

      # I want o go to my listing show page
        redirect_to @event# This is the way to pass in an id
      else
        redirect_to new_event_path
      end

  end

  def update
    if @event.update(event_params)

      # The next line is because I need to call the user_id parameter

      @event.user_id = current_user.id
      redirect_to event_path(@event.id)
    else
      redirect_to edit_event_path(@event.id)
    end

  end




private

  def event_params
      params.require(:event).permit(:event_type, :title, :location, :start_date, :end_date, :start_time, :end_time, :description, :isfree, :rate, :open_spots, :age_range, :event_pic, :user_id)
  end

  def set_listing
    @event = Event.find(params[:id])

  end

end # END OF CLASS

