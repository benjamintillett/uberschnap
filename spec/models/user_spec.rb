# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#


require 'spec_helper'

describe User do
	before { @images = "http://imgur.com/YVsthxL,http://imgur.com/epErFQN,http://imgur.com/Dhjg9Nt,http://imgur.com/MFJ2Jtq,http://imgur.com/OKW9sGR,http://imgur.com/XbWXkgV,http://imgur.com/JC58Ddl,http://imgur.com/8JPc40J,http://imgur.com/VagGxI8,http://imgur.com/XXhpIE9,http://imgur.com/K3aWDfo,http://imgur.com/DK4NF95,http://imgur.com/JZcUHql,http://imgur.com/mTfrirR,http://imgur.com/EGX2UXt" }
	before { @user = User.new(name: "johns wedding", email: "example@wedding.com", password: "foobar", password_confirmation: "foobar", images: @images) }
	
	subject { @user } 
	
	it { should respond_to(:name) }
	it { should respond_to(:email) } 
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:images) }
	it { should respond_to(:image_array) }
	
	it { should be_valid } 
	
	
	
	describe "image array" do 
		its(:image_array) { should be_a Array } 
	end
		
	describe "when image list is not present" do 
		before { @user.images = " " } 
		it { should_not be_valid }
	end
	
	describe "when image list is not valid" do 
		before { @user.images = "WEE" } 
		it { should_not be_valid } 
	end
	
	
	
	describe "when name is not present" do 
		before { @user.name = " " }
		it { should_not be_valid }
	end
	
	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end
	
	describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
	end
	
	describe "when password is to short" do 
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end
	
	describe "return value of authentication method" do 
		before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }
		
		describe "with valid password" do 
			it { should == found_user.authenticate(@user.password) }
		end
		
		describe "with invalid password" do 
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }
			
			it { should_not == user_for_invalid_password }
			specify { user_for_invalid_password.should be false }
		end
	end
	
	
	describe "when email is not present" do 
		before { @user.email = " " } 
		it { should_not be_valid } 
	end
	
	describe "when name is to long" do 
		before { @user.name = "a" * 151 }
		it { should_not be_valid } 
	end 
	
	describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end
  describe "when email is address is already taken" do 
  	before do 
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end

		it { should_not be_valid }
	end
end