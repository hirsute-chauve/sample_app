require 'spec_helper'

describe PagesController do
	render_views

	before(:each) do
		@base_title = "Simple App du Tutoriel Ruby on Rails |"
	end
	
	describe "Visit '/home'" do
		it "returns http success" do
			visit '/'
			expect(response).to be_success
		end
		it "devrait avoir le bon titre" do
			visit root_path 
			expect(find('title')).to have_content( @base_title + ' Accueil')
		end
	end

	describe "Visit '/contact'" do
		it "returns http success" do
			 visit '/contact'
			expect(response).to be_success
		end

		it "devrait avoir le bon titre" do
			visit '/contact'
			expect(find('title')).to have_content( @base_title + " Contact")
		end
	end

	describe "Visit '/about'" do
		it "returns http success" do
			visit '/about'
			expect(response).to be_success
		end

		it "devrait avoir le bon titre" do
			visit '/about'
			expect(find('title')).to have_content( @base_title + " À Propos")
		end
	end

	describe "Visit '/help'" do
		it "returns http success" do
			visit '/help'
			expect(response).to be_success
		end

		it "devrait avoir le bon titre" do
			visit '/help'
			expect(find('title')).to have_content(@base_title + " Aide")
		end
	end
end
