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
	it "devrait avoir le bon lien sur le layout" do
		visit root_path
		click_link "À Propo"
		expect(find 'title').to have_content "À Propos"
		click_link "Aide"
		expect(find 'title').to have_content "Aide"
		click_link "Contact"
		expect(find 'title').to have_content "Contact"
		click_link "Accueil"
		expect(find 'title').to have_content "Accueil"
		click_link "S'inscrire"
		expect(find 'title').to have_content "Inscription"
	end
end
