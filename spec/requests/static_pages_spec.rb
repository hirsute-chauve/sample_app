require 'spec_helper'

describe "Pages statiques" do
	let(:base_title) { "Simple App du Tutoriel Ruby on Rails" }

	describe "La page Accueil" do
		before(:each) { visit root_path }

		it "contient l'expression 'Accueil'" do
			expect(page).to have_content "Accueil"
		end

		it "a pour titre seulement le titre de base" do
			expect(page).to have_title(full_title(""))
		end
		it "ne comporte pas 'Accueil' dans le titre" do
			expect(page).to_not have_title(full_title("Accueil"))
		end
	end

	describe "La page Contact" do
		before(:each) { visit contact_path }

		it "contient l'expression 'Contact'" do
			expect(page).to have_content "Contact"
		end

		it "a pour titre 'Contact'" do
			expect(page).to have_title "#{base_title} | Contact"
		end
	end

	describe "La page Aide" do
		before(:each) { visit help_path }

		it "contient l'expression 'Aide'" do
			expect(page).to have_content "Aide"
		end

		it "a pour titre 'Aide'" do
			expect(page).to have_title "#{base_title} | Aide"
		end
	end

	describe "La page À Propos" do
		before(:each) { visit about_path }

		it "contient l'expression 'À Propos'" do
			expect(page).to have_content "À Propos"
		end

		it "a pour titre 'À Propos'" do
			expect(page).to have_title "#{base_title} | À Propos"
		end
	end

	describe "Les hyperliens statiques sur les en-têtes et pieds de page" do
		before(:each) { visit root_path }

		describe "Le lien 'À Propos" do

			it "mène à la page 'À Propos'" do
				click_link "À Propos"
				expect(page).to have_title(full_title("À Propos"))
			end
		end

		describe "Le lien 'Aide'" do

			it "mène à la page 'Aide'" do
				click_link "Aide"
				expect(page).to have_title(full_title("Aide"))
			end
		end

		describe "Le lien 'Contact'" do

			it "mène à la page 'Contact'" do
				click_link "Contact"
				expect(page).to have_title(full_title("Contact"))
			end
		end

		describe "Le lien 'Accueil'" do

			it "mène à la page 'Accueil'" do
				click_link "Accueil"
				expect(page).to have_title(full_title(""))
			end 
		end

		describe "Le lien 'Inscription'" do

			it "mène à la page 'Inscription'" do
				click_link "S'inscrire"
				expect(page).to have_title(full_title("Inscription"))
			end
		end
	end
end
