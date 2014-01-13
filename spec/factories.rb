FactoryGirl.define do
  factory :email do
    name     				"Michael Hartl"
    email    				"michael@example.com"
		message 				"This is a test message"
		event_location 	"foobar"
		event_type			"Party"
		date			DateTime.new(2012)
  end
  
  factory :user do 
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
    images "http://imgur.com/YVsthxL,http://imgur.com/epErFQN,http://imgur.com/Dhjg9Nt,http://imgur.com/MFJ2Jtq,http://imgur.com/OKW9sGR,http://imgur.com/XbWXkgV,http://imgur.com/JC58Ddl,http://imgur.com/8JPc40J,http://imgur.com/VagGxI8,http://imgur.com/XXhpIE9,http://imgur.com/K3aWDfo,http://imgur.com/DK4NF95,http://imgur.com/JZcUHql,http://imgur.com/mTfrirR,http://imgur.com/EGX2UXt"
  end
end

