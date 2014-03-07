class RoomsController < ApplicationController 

	def index
		@rooms = Room.all
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
		@room = Room.new
		@campuses = Campus.all
	end

	def create
		@room = Room.new(room_params)

		if @room.save
			redirect_to @room, notice: "#{@room.name} has been successfully created!"
		else
			@campuses = Campus.all
			render :new
		end
	end

	def edit
		@room = Room.find(params[:id])
		@campuses = Campus.all
	end

	def update
		@room = Room.find(params[:id])

		if @room.update(room_params)
			redirect_to @room, notice: "#{@room.name} has been successfully updated!"
		else
			@campuses = Campus.all
			render :edit
		end
	end

	def destroy
		@room = Room.find(params[:id])

		@room.destroy
		redirect_to rooms_path, notice: "#{@room.name} has been successfully deleted!"
	end

	private

	def room_params
		params.require(:room).permit(:name, :description, :capacity, :campus_id)
	end

end