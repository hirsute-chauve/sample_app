require 'spec_helper'

describe ApplicationHelper do
	describe "full_title" do
		it "inclue le titre de page" do
			expect(full_title("foo")).to match(/foo/)
		end

		it "inclue le titre de base" do
			expect(full_title("foo")).to match(/^Simple App du Tutoriel Ruby on Rails/)
		end

		it "n'inclue pas une barre verticale pour la page d'accueil" do
			expect(full_title("")).not_to match(/\|/)
		end
	end
end
