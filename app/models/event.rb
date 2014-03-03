class Event < ActiveRecord::Base
	belongs_to :service
	belongs_to :campus

	validates :name,
				length: { minimum: 4 },
				uniqueness: { scope: [:date, :time], message: "must be a unique event with a different date/time"  } 
	validates :date, presence: true
	validates :service_id, presence: true
	validates :campus_id, presence: true

end