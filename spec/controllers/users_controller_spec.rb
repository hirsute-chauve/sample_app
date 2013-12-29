require 'spec_helper'

describe UsersController do
render_views
  describe "Visit 'new'" do
    it "returns http success" do
      visit '/users/new'
      expect(response).to be_success
    end
		it "devrait avoir le titre adéquat" do
			visit '/users/new'
			expect(find 'title').to have_content('Inscription')
		end
  end

end
