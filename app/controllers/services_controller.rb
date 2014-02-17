class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

	def show 
		@service = Service.find(params[:id])
	end 

	def new 
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)

		if @service.save
			redirect_to @service
		else
			render :new
		end
	end

	def edit 
		@service = Service.find(params[:id])
	end

	def update
		@service = Service.find(params[:id])

		if @service.update(service_params)
			redirect_to @service, notice: "#{@service.name} has been successfully updated!"
		else
			render :edit
		end

	end

private

	def service_params
		params.require(:service).permit(:name, :description)
	end

end