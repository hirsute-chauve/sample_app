require 'spec_helper'

describe "LayoutLinks" do
	it "devrait trouver une page Accueil à '/'" do
		visit '/'
		expect(find 'title').to have_content "Accueil"
	end

	it "devrait trouver une page Contact à '/contact'" do
		visit '/contact'
		expect(find 'title').to have_content "Contact"
	end

	it "devrait trouver une page À Propos à '/about'" do
		visit '/about'
		expect(find 'title').to have_content "À Propos"
	end

	it "devrait trouver une page Aide à '/help'" do
		visit '/help'
		expect(find 'title').to have_content "Aide"
	end
	it "devrait avoir une page d'inscription à'/signup'" do
		visit '/signup'
		expect(find 'title').to have_content "Inscription"
	end
end
