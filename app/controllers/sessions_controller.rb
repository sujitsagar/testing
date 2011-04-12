class SessionsController < ApplicationController
  layout "signuplogin"
   #before_filter :checksignin
  def new
    @title = "Sign in"
    #@user = User.new
    redirect_to current_user if signed_in?
  end
  
  def create
    user = User.authenticate(params[:session][:email],params[:session][:password])
    if user.nil?
        # Create an error message and re-render the signin form.
        flash.now[:error] = "Invalid email/password combination."
        @title = "Sign in"
        render 'new'
    #else if !user.active?
    #    flash.now[:error] = "Your Account is not active"
    #    @title = "Sign in"
    #    render 'new'
    else     
        # Sign the user in and redirect to the user's show page.
        sign_in user
        redirect_to cheapsdiary_path
    end
    #end
  end
  
  def destroy
     sign_out
     flash[:success] = "Successfully Loggedout"
     redirect_to root_path
  end
  
  private 
  
     def checksignin
       redirect_to(users_path) if signed_in?
     end

end
