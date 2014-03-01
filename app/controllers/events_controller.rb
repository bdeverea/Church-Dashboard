class EventsController < ApplicationController

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
		@campuses = Campus.all
		@services = Service.all 
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			redirect_to @event, notice: "#{@event.name} was successfully created!"
		else
			@campuses = Campus.all
			@services = Service.all 
			render :new
		end
	end

	private

	def event_params
		params.require(:event).permit(:name, :date, :time, :service_id, :campus_id)
	end

end
