require 'spec_helper'

describe "Pages User" do
	subject { page }
	describe "Page d'inscription" do
		before(:each) { visit signup_path }

		it "contient l'expression 'Inscription'" do
			expect(page).to have_content "Inscription"
		end
		it "a pour titre 'Inscription'" do
			expect(page).to have_title(full_title("Inscription"))
		end
	end

	describe "Page Profil" do
		let(:user) { FactoryGirl.build(:user) }
		before do
		user.save 
			visit user_path(user)
		end
		
		it { should have_content (user.name) }
		it { should have_title(user.name)}
	end

	describe "Formulaire d'inscription" do
		before { visit signup_path }
		let(:submit) { "Créer mon compte" }

		describe "Des informations invalides" do
			it "ne créent pas de nouvel utilisateur" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "Des informations valides" do
			let(:user) { FactoryGirl.build(:user) }
			before do
				fill_in "Name",					with: user.name
				fill_in "Email", 				with: user.email
				fill_in "Password",			with: user.password
				fill_in "Confirmation",	with: user.password_confirmation
			end

			it "créent un nouvel utilisateur" do
				expect { click_button submit }.to change(User, :count)
			end
		end
	end
end
