class Blog < ApplicationRecord
	validates :title, presence: true, uniqueness: true

  belongs_to :status
	belongs_to :user

	has_one_attached :photo

end
