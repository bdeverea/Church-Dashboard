class Event < ActiveRecord::Base
	attr_accessor :date

	belongs_to :service
	belongs_to :campus
	belongs_to :room

	validates :name,
							length: { minimum: 4 },
							uniqueness: { scope: :time, message: "already exists. It must be a unique event with a different date/time"  } 
	validates :time, presence: true
	validates :service_id, presence: true
	validates :campus_id, 
							presence: true,
							numericality: {message: "is invalid"}
	validates :attendance, numericality: { greater_than_or_equal_to: 0 }

	before_validation :combine_date_time

	def self.ytd_attendance
		date = Date.today
		results = where("time >= ? AND time <= ?", date.beginning_of_year, date.end_of_year).group(:id, :name)
			
		data = Hash.new

		results.each do |i|
			if data.has_key?(i.name)
				data[i.name] << i.attendance
			else
				data[i.name] = [i.attendance]
			end
		end
		
		return data
	end

	private

	def combine_date_time
		if date != ""
			new_date = Date.parse(date)
			self.time = time.change(month: new_date.month, day: new_date.day, year: new_date.year)
		end
	end

end