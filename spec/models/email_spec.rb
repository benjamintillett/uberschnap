# == Schema Information
#
# Table name: emails
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  message        :string(255)
#  email          :string(255)
#  event_type     :string(255)
#  event_location :string(255)
#  date           :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Email do
	let(:email) { FactoryGirl.create(:email) }	
	subject { email }
	
	it { should respond_to(:name) }
	it { should respond_to(:message) }
	it { should respond_to(:email) }
	it { should respond_to(:date) }
	it { should respond_to(:event_type) }
	it { should respond_to(:event_location) }
	
	describe "when name is not present" do 
		before { email.name = "" }
		it { should_not be_valid }
	end		
	
	describe "when event location is not present" do 
		before { email.event_location = "" }
		it { should_not be_valid }
	end		
	
	describe "when event type is not present" do 
		before { email.event_type = "" }
		it { should_not be_valid }
	end			
	
	describe "when message is not present" do 
		before { email.message = "" }
		it { should_not be_valid }
	end
	
	describe "when email is not present" do 
		before { email.email = "" }
		it { should_not be_valid }
	end		

	describe "when email is not valid" do 
		before { email.email = "efdsof" } 
		it { should_not be_valid }
	end

	
	describe "should have correct date" do 
		its(:date) { should == DateTime.new(2012) }
	end

end
