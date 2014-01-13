require 'spec_helper'

describe "Authentification" do
	subject { page }

	describe "page de connexion" do
		before { visit signin_path }

		it { should have_content('Connexion') }
		it { should have_title('Connexion') }
	end

	describe "connexion" do
		before { visit signin_path }

		describe "avec des infos invalides" do
			before { click_button "Connexion" }

			it { should have_title("Connexion") }
			it { should have_selector("div.alert.alert-error") }

			describe "après avoir visité une autre page" do
				before { click_link "Accueil" }
				it { should_not have_selector("div.alert.alert-error") }
			end
		end

		describe "avec des infos valides" do
			let(:user) {FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Connexion"
			end

			it { should have_title(user.name) }
			it { should have_link("Profile",				href: user_path(user)) }
			it { should have_link("Déconnexion", 		href: signout_path) }
			it { should_not have_link("Connexion",	href: signin_path) }
			describe "après une déconnexion" do
				before { click_link "Déconnexion" }
				it { should have_link("Connexion") }
			end
		end
	end
end
