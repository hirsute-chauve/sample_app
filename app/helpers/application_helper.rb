module ApplicationHelper
	# Retourner un titre basé sur la page.
	def logo
		image_tag "logo.png", :alt => "Application Example", :class => "img-rounded"
	end
	def titre
		base_titre = "Simple App du Tutoriel Ruby on Rails"
		if @titre.nil?
			base_titre
		else
			"#{base_titre} | #{@titre}"
		end
	end
end
