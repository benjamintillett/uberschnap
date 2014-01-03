class EmailsController < ApplicationController
	def new
		@email = Email.new
	end
	
	def create
		@email= Email.new(params[:email])
  	if @email.save
  		BookingsMailer.contact_email(@email).deliver
  		redirect_to email_path(@email)
  	else 
  		render new_email_path
  	end
	end

	def show
		@email = Email.find_by_id(params[:id])
	end	
end
