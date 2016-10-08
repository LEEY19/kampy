class RequestsController < ApplicationController
	def new 
		@request = Request.new
		@event = Event.find(params["button"]["event_id"])
		#@event is only created temporarily as the event id will be obtained from the event show page
	end

	def create
		@request = current_user.requests.new(request_params)
		@event = @request.event
		@request.status = "Pending"
		if @request.save
		  (@event.users.uniq - [current_user]).each do |user|
	        Notification.create(recipient: user, actor: current_user, action: "submitted", notifiable: @request)
	      end
			redirect_to @request
		else
			redirect_to root
		end
	end

	def show
		@request = Request.find(params[:id])
	end

	private

	def request_params
		params.require(:request).permit(:comment, :user_id, :event_id)
	end
end
