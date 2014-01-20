class UsersController < ApplicationController
		before_filter :signed_in_user, only: [:show,]
		before_filter :correct_user, only: [:show,]
		
	def show
		@user = User.find(params[:id])
	end
	
  def new
  	@user = User.new
  end
  
  def create 
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "User succesfully added" 
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  
  private 
		def signed_in_user
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(signin_path) unless current_user?(@user)
		end
		
end
