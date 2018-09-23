class Education < ApplicationRecord
	validates :title, presence: true

	belongs_to :status
end
