class Position < ApplicationRecord
	validates :title, presence: true
	belongs_to :status
end
