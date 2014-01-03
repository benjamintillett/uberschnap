require "spec_helper"

describe BookingsMailer do
	let(:email) { FactoryGirl.create(:email) }
	let(:mail) { BookingsMailer.contact_email(email).deliver }
 
	 
	it "should have correct recipient" do
		mail.to.should == ["benjamin.tillett@gmail.com"]	
	end 
	it "should have correct sender"  do
		mail.from.should == [email.email]
	end 
	#ensure the message is correct
	it "should have correct subject" do 
		mail.subject.should == "Message from #{email.name}"
	end
	it "should have correct content" do 
		mail.body.should match("This") 
	end
	it "should have correct date" do 
		mail.body.should match("January 01, 2012 00:00") 
	end
	
end