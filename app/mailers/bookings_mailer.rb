class BookingsMailer < ActionMailer::Base
  default to: 'benjamin.tillett@gmail.com'
	
	def contact_email(email)
		@email = email
		mail(from: @email.email, subject: "Message from #{@email.name}") 
	end

end
