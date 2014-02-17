class Campus < ActiveRecord::Base

	validates :name, presence: true
	validates :address1, presence: true

	default_scope order('name ASC')

	def address
		"#{address1}\n#{address2}\n#{city}, #{state}, #{postal_code}"
	end

end
