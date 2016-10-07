class RequestsController < ApplicationController
	def new 
		@request = Request.new
		@event = Event.find(params[:event_id])
		#@event is only created temporarily as the event id will be obtained from the event show page
	end

	def create
		@request = current_user.requests.new(request_params)
		@request.status = "Pending"
		if @request.save
			redirect_to root
		else
			redirect_to @request
		end
	end

	def show
		@request = Request.find_by(event_id: params[:event_id])
	end

	private

	def request_params
		params.require(:request).permit(:comment, :user_id, :event_id)
	end
end
