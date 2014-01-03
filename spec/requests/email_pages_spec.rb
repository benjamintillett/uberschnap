require 'spec_helper'

describe "Email Pages" do
	
	subject { page }
	
	describe "bookings page" do 
		before { visit bookings_path }
	  it { should have_selector('h1', text: 'Quote me please') }
	  
	  it { should have_selector('label', text: 'Name') }
	  it { should have_selector('input', name: 'email[name]') }
	  
	  it { should have_selector('label', text: 'Email') }
	  it { should have_selector('input', name: 'email[email]') }
	  
	  it { should have_selector('label', text: 'Event type') }
	  it { should have_selector('select', id: 'email[event_type]') }
	
	  it { should have_selector('label', text: 'Event date') }
	  it { should have_selector('select', name: 'email[date(3i)]') }
	  it { should have_selector('select', name: 'email[date(2i)]') }
	  it { should have_selector('select', name: 'email[date(1i)]') }   

	  it { should have_selector('label', text: 'Event location') }
	  it { should have_selector('input', name: 'email[location]') }
	  
	  it { should have_selector('label', text: 'Message') }
	  it { should have_selector('input', name: 'email[message]') }	    	  	  	  
	  
	  it { should have_selector('input', name: 'commit') }
	
		describe "submit form" do 
			
			describe "with invalid info" do 
				it "should not create a email" do 
					expect { click_button "Send" }.not_to change(Email, :count)
				end
			end
			
			describe "with valid info" do
				before do 
					fill_in "Name",				with: "Joe Blogs"
					fill_in "Email", 			with: "Joe@blogs.com"
					fill_in "Message",		with:	"Fuck me sideways"	
					fill_in "Event location", 		with: "London"
					select('Party', from: 'Event type')
					select("17", from: "email_date_3i")
				end
				it "should create an email" do 
					expect { click_button "Send" }.to change(Email, :count).by(1)
				end
				it "should send an email" do 
					click_button "Send"
					ActionMailer::Base.deliveries.last.from.should == ["Joe@blogs.com"]
				end
				
				describe "after creating a valid user" do 
					describe "email show page" do 
						before { click_button "Send" }
						it { should have_selector('h1', text: 'Your Email was sent') }
					end
				end 
			end
		end
	end
	
end  