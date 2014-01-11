require 'spec_helper'

describe "UserPages" do
	
	subject { page }
		
	describe "Add User Page" do 
		before { visit add_user_path }
		
    it { should have_selector('h1',    text: 'Add User') }
	end
end 
