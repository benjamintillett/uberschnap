FactoryGirl.define do
  factory :email do
    name     				"Michael Hartl"
    email    				"michael@example.com"
		message 				"This is a test message"
		event_location 	"foobar"
		event_type			"Party"
		date			DateTime.new(2012)
  end
end

