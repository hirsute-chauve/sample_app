require 'spec_helper'

describe "Pages statiques" do

	let(:base_title) { "Simple App du Tutoriel Ruby on Rails" }

	describe "La page Accueil" do

		it "contient l'expression 'Accueil'" do
			visit '/'
			expect(page).to have_content "Accueil"
		end

		it "a pour titre 'Accueil'" do
			visit '/'
			expect(page).to have_title "#{base_title} | Accueil"
		end
	end

	describe "La page Contact" do

		it "contient l'expression 'Contact'" do
			visit '/contact'
			expect(page).to have_content "Contact"
		end

		it "a pour titre 'Contact'" do
			visit '/contact'
			expect(page).to have_title "#{base_title} | Contact"
		end
	end

	describe "La page Aide" do

		it "contient l'expression 'Aide'" do
			visit '/help'
			expect(page).to have_content "Aide"
		end

		it "a pour titre 'Aide'" do
			visit '/help'
			expect(page).to have_title "#{base_title} | Aide"
		end
	end

	describe "La page À Propos" do

		it "contient l'expression 'À Propos'" do
			visit '/about'
				visit root_path
			expect(page).to have_content "À Propos"
		end

		it "a pour titre 'À Propos'" do
			visit '/about'
			expect(page).to have_title "#{base_title} | À Propos"
		end
	end

	describe "Les hyperliens statiques sur les en-têtes et pieds de page" do

		describe "Le lien 'À Propos" do

			it "mène à la page 'À Propos'" do
				visit root_path
				click_link "À Propos"
				expect(find 'title').to have_content "À Propos"
			end
		end

		describe "Le lien 'Aide'" do

			it "mène à la page 'Aide'" do
				visit root_path
				click_link "Aide"
				expect(find 'title').to have_content "Aide"
			end
		end

		describe "Le lien 'Contact'" do

			it "mène à la page 'Contact'" do
				visit root_path
				click_link "Contact"
				expect(find 'title').to have_content "Contact"
			end
		end

		describe "Le lien 'Accueil'" do

			it "mène à la page 'Accueil'" do
				visit root_path
				click_link "Accueil"
				expect(find 'title').to have_content "Accueil"
			end 
		end

		describe "Le lien 'Inscription'" do

			it "mène à la page 'Inscription'" do
				visit root_path
				click_link "S'inscrire"
				expect(find 'title').to have_content "Inscription"
			end
		end
	end
end
