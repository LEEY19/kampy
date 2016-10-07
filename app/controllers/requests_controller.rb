class RequestsController < ApplicationController
	def new 
		@request = Request.new
		@event = Event.find(params["button"]["event_id"])
		#@event is only created temporarily as the event id will be obtained from the event show page
	end

	def create
		@request = current_user.requests.new(request_params)
		@request.status = "Pending"
		if @request.save
			redirect_to @request
		else
			redirect_to root
		end
	end

	def show
		byebug
		@request = Request.find_by(event_id: params[:event_id])
	end

	private

	def request_params
		params.require(:request).permit(:comment, :user_id, :event_id)
	end
end
