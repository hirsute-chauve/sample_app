module ApplicationHelper
	# Retourner un titre basé sur la page.
	def logo
		image_tag "logo.png", :alt => "Application Example", :class => "img-rounded"
	end
	def full_title(page_title)
		base_title = "Simple App du Tutoriel Ruby on Rails"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
