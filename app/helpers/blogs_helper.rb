module BlogsHelper
	def photo_path( image_blob = nil, size = '480x360' )
    if image_blob.attached?
      image_blob.variant(resize: size)
    else
      'no-image.png'
    end
  end
end
