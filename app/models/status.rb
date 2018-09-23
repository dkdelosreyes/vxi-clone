class Status < ApplicationRecord
	validates :code, presence: true, uniqueness: true, length: {maximum: 20}

	has_many :blogs

end
