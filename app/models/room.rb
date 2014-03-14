class Room < ActiveRecord::Base
	belongs_to :campus

	validates :name, 
				length: { minimum: 4 },
				uniqueness: { scope: :campus_id, message: "must be a unique name for this campus"  } 
	# validates :campus_id, presence: true
	validates :capacity, numericality: { greater_than_or_equal_to: 0 }


end
