class Status < ApplicationRecord
	validates :code, presence: true, uniqueness: true, length: {maximum: 20}

	has_many :blogs
	has_many :locations
	has_many :educations
	has_many :experiences
	has_many :positions
	has_many :source_infos

end
