class Campus < ActiveRecord::Base

	has_many :events
	
	validates :name, presence: true, length: { minimum: 4 }, uniqueness: true
	validates :address1, presence: true, length: { minimum: 4 }
	validates :city, presence: true
	validates :state, presence: true, length: { maximum: 2 }
	validates :postal_code, presence: true, numericality: { only_integer: true }
	validates :country, presence: true, length: { maximum: 2 }

	default_scope { order'name ASC' }

	def address
		"#{address1}\n#{address2}\n#{city}, #{state}, #{postal_code}"
	end

end
