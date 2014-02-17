class Service < ActiveRecord::Base

	validates :name, uniqueness: true, presence: true
	validates :description, presence: true, length: { minimum: 10 }


end
