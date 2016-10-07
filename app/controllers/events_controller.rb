class EventsController < ApplicationController

before_action :set_event, only: [:show, :update, :edit, :destroy]




  def index
    @events = Event.all

  end

  def new
    @event= Event.new
    @user = User.new # To delete later - DEV

  end

  def create
    # byebug
    @event = current_user.events.new(event_params)
    @event.full_address = [params[:event][:housenumber], params[:event][:street], params[:event][:postcode], params[:event][:city], params[:event][:state], params[:event][:country]].join(',')

      if @event.save

      # I want o go to my event show page
        redirect_to event_path(@event.id) # This is the way to pass in an id
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
      params.require(:event).permit(:event_type, :title, :location, :start_date, :end_date, :start_time, :end_time, :description, :isfree, :price, :open_spots, :age_range, :event_pic, :user_id, :housenumber, :street, :postcode, :city, :state, :country)
  end

  def set_event
    @event = Event.find(params[:id])

  end

end # END OF CLASS

