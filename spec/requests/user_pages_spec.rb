require 'spec_helper'

describe "Pages User" do
	describe "Page d'inscription" do
		before(:each) { visit signup_path }

		it "contient l'expression 'Inscription'" do
			expect(page).to have_content "Inscription"
		end
		it "a pour titre 'Ìnscription'" do
			expect(page).to have_title(full_title("Inscription"))
		end
	end
end
