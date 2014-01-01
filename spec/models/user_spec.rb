require 'spec_helper'

describe User do
	before { @user = User.new(name: "Utilisateur Exemple", email: "utilisateur@exemple.com",
														password: "foobar", password_confirmation: "foobar") }
	subject { @user }

	it { should respond_to :name }
	it { should respond_to :email }
	it { should respond_to :password_digest }
	it { should respond_to :password }
	it { should respond_to :password_confirmation }
	it { should respond_to :authenticate }

	it {should  be_valid }

	describe "quand le nom est absent" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "quand le email est absent" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "quand le nom est est trop long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "quand le format d'email est invalide" do
		it "doit être invalide" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "quand le format d'adresse est valide" do
		it "doit être valide" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to	be_valid
			end
		end
	end

	describe "quand l'adresse email existe déjà" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it {should_not be_valid}
	end

	describe "quand le mot de passe est absent" do
		before do
			@user = User.new(name: "Utilisateur Exemple", email: "utilisateur@exemple.com",
											 password: " ", password_confirmation: " ")
		end
		it { should_not be_valid }
	end

	describe "quand le mot de passe ne correspond pas à la confirmation" do
		before { @user.password_confirmation = "pas_pareil" }
		it {should_not be_valid }
	end

	describe "valeur de retour de la méthode 'authenticate'" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "avec un mot de passe valide" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "avec un mot de passe invalide" do
			let(:user_for_invalid_password) {found_user.authenticate("invalide") }
			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
		end
	end

	describe "un mot de passe trop court" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it {should be_invalid }
	end

	describe "une adresse email en capitale" do
		let(:uppercase_address) { "ADDRESS@UPPERCASE.COM" } 
		before do
			@user.email = uppercase_address 
			@user.save
		end
		it "est enregistrée en minuscules" do
			expect(@user.reload.email).to eq uppercase_address.downcase
		end
	end
end
