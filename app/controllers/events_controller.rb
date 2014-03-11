class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
		@campus = Campus.new
		@campuses = Campus.all
		@services = Service.all 
	end

	def edit
		#TODO: DRY up and cache campuses and services
		@campuses = Campus.all
		@services = Service.all 
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		
		if params[:event][:campus_id] == 'Create New...'
			#This path should only be hit if js is turned off
			redirect_to new_campus_url
		elsif @event.save
			redirect_to @event, notice: "#{@event.name} was successfully created!"
		else
			@campuses = Campus.all
			@services = Service.all 
			render :new
		end
	end

	def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to @event, notice: "#{@event.name} was successfully updated!"
		else 
			@campuses = Campus.all
			@services = Service.all 
			render :edit
		end
	end

	def destroy
		@event = Event.find(params[:id])
		
		@event.destroy
		redirect_to events_url, notice: "#{@event.name} has been successfully deleted!"
	end

	private

	def event_params
		params.require(:event).permit(:name, :date, :time, :service_id, :campus_id, :attendance)
	end

end
