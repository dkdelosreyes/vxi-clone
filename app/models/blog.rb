class Blog < ApplicationRecord
	validates :title, presence: true, uniqueness: true

	belongs_to :status

	has_one_attached :photo

	def photo_path( image_blob = nil )
    if image_blob.attached?
      image_blob.variant(resize: "100x100")
    else
      'no-image.png'
    end
  end
end
