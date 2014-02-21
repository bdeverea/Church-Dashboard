class Event < ActiveRecord::Base
	belongs_to :service
	belongs_to :campus

	validates :name, presence: true, uniqueness: { scope: :date_time, message: "must be a unique event with a different date/time" } 
	validates :date_time, presence: true
	validates :service_id, presence: true
	validates :campus_id, presence: true

end