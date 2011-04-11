class UsersignupController < UsersController
  layout 'signuplogin'
  def new
    @newuser= User.new
    @title = "Sign up page"
  end

  def create
     @newuser = User.new(params[:newuser])
     if @newuser.save
        #sign_in @user
        #redirect_to @user #enable it to direct sign in after sign up
        flash[:success] = "Registration successful, Please login to continue"
        #redirect_to signup_path
     else
        @title = "Sign up"
        render 'new'
     end
  end
end
