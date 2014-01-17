require 'spec_helper'

describe "Authentication" do

  subject { page }


	describe "authorization" do
		
		describe"for non-signed-in users" do 
			let(:user) { FactoryGirl.create(:user) }
			
			describe "in the Users controller" do 
			
				describe "visiting the show page" do 
					before { visit user_path(user) }
					it { should have_selector('h1', text: 'Sign in') }
				end
			end
		end
	end
	
  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
  end
  
  describe "signin" do 
  	before { visit signin_path } 
  	
  	describe "with invalid information" do 
  		before { click_button "Sign in" } 
  		
  		it { should have_content("Sign in") }
  		it { should have_selector('div.alert.alert-danger') }
  	
  		describe "after visiting another page" do 
  			before { click_link "photo booth" }
  			it { should_not have_selector('div.alert.alert-danger') }
  		end	
  	end
  	
  	describe "with valid information" do 
  		let(:user) { FactoryGirl.create(:user) }
  		before do 
  			fill_in "Email", with: user.email.upcase
  			fill_in "Password", with: user.password
  			click_button "Sign in"
  		end
  		  		
  		it { should have_content(user.name) }
		end
	end
	

end

		