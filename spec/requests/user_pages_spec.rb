require 'spec_helper'

describe "UserPages" do
	
	subject { page }
		
	describe "profile page" do 
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
		
		it { should have_selector('h4', text: user.name) } 
		it { should have_selector('img', src: "http://imgur.com/YVsthxL.jpg") }
	end
		
	
	describe "Add User Page" do 
		before { visit add_user_path }
    it { should have_selector('h1',    text: 'Add User') }
	end
	
	describe "signup" do 
	
		before { visit add_user_path }
		
		let(:submit) { "Create account" } 
		
		describe "with invalid information" do 
			it "should not create a user" do 
				expect { click_button submit }.not_to change(User, :count)
			end
		end
		
		describe "with valid information" do 
			before do 
				fill_in "Name", 					with: "Love show"
				fill_in "Email", 					with: "user@example.com"
				fill_in "Password", 			with: "foobar"
				fill_in "Confirmation", 	with: "foobar"
				fill_in "Image list",			with: ".com,"
			end
			
			it "should create a user" do 
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end 	
end 
