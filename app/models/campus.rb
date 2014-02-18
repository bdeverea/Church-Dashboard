class Campus < ActiveRecord::Base

	validates :name, presence: true
	validates :name, length: { minimum: 4 }
	validates :name, uniqueness: true
	validates :address1, presence: true
	validates :address1, length: { minimum: 4 }

	default_scope { order'name ASC' }

	def address
		"#{address1}\n#{address2}\n#{city}, #{state}, #{postal_code}"
	end

end
