class CampusesController < ApplicationController

	def index
		@campuses = Campus.all
	end

	def show
		@campus = Campus.find(params[:id])
	end

	def new
		@campus = Campus.new

		respond_to do |format|
			format.html {}
      format.js   {}
		end

	end

	def create
		@campus = Campus.new(campus_params)

		if @campus.save
			respond_to do |format|
				format.html { redirect_to @campus, notice: "#{@campus.name} was successfully created!" }
      	format.js
			end
		else
			render :new
		end
	end

	def edit
		@campus = Campus.find(params[:id])
	end

	def update
		@campus = Campus.find(params[:id])

		if @campus.update(campus_params)
			redirect_to @campus, notice: "#{@campus.name} was successfully updated!"
		else
			render :edit
		end
	end

	def destroy
		@campus = Campus.find(params[:id])

		@campus.destroy
		redirect_to campuses_url, notice: "#{@campus.name} has been successfully deleted!"
	end

private

	def campus_params
		params.require(:campus).permit(:id, :name, :address1, :address2, :city, :state, :postal_code, :country, :phone, :room, rooms_attributes:[:name, :description, :capacity])
	end

end