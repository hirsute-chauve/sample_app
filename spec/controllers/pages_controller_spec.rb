require 'spec_helper'

describe PagesController do
	render_views

	before(:each) do
		@base_title = "Simple App du Tutoriel Ruby on Rails |"
	end
	
	describe "Get 'home'" do
		it "returns http success" do
			get 'home'
			expect(response).to be_success
		end
		it "devrait avoir le bon titre" do
			visit '/' 
			expect(find 'title').to have_content( @base_title + ' Accueil')
		end
	end

	describe "Get 'contact'" do
		it "returns http success" do
			 get 'contact'
			expect(response).to be_success
		end

		it "devrait avoir le bon titre" do
			visit '/contact'
			expect(find('title')).to have_content( @base_title + " Contact")
		end
	end

	describe "Get 'about'" do
		it "returns http success" do
			get 'about'
			expect(response).to be_success
		end

		it "devrait avoir le bon titre" do
			visit '/about'
			expect(find('title')).to have_content( @base_title + " À Propos")
		end
	end

	describe "Get 'help'" do
		it "returns http success" do
			get 'help'
			expect(response).to be_success
		end

		it "devrait avoir le bon titre" do
			visit '/help'
			expect(find('title')).to have_content(@base_title + " Aide")
		end
	end
end
