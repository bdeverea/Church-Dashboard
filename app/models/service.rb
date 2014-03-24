class Service < ActiveRecord::Base
	has_many :events, dependent: :destroy
	
	validates :name, uniqueness: true, presence: true
	validates :description, presence: true, length: { minimum: 10 }

end
