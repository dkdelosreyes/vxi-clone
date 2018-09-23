module ApplicationHelper
	include BlogsHelper

	def full_title(title = "")
		base_title = "VXI Family"
		if !title.empty?
			base_title + ' | ' + title
		else
			base_title
		end
	end
end
