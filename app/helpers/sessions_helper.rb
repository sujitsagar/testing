module SessionsHelper

   def sign_in(user)
     cookies.permanent.signed[:remember_token] = [user.id, user.salt]
     current_user = user
   end
   def current_user
     @current_user ||= user_from_remember_token
   end
   def signed_in?
     !current_user.nil?
   end
   def sign_out
     cookies.delete(:remember_token)
     current_user = nil
   end

   private
   def user_from_remember_token
     User.authenticate_with_salt(*remember_token)
   end
   def remember_token
     cookies.signed[:remember_token] || [nil, nil]
   end
   
   def deny_access
     redirect_to signin_path, :notice => "Please sign in to access this page."
   end
   def authenticate
     deny_access unless signed_in?
   end
   def admin_user
       #@user = User.find(params[:id])
       #flash[:error] = "Sorry You dont have access to this page"
       redirect_to current_user unless current_user.admin?
   end  
   def current_user?(user)
     user == current_user
   end
   def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
   end
   def correct_user
       @user = User.find(params[:id])
       redirect_to(root_path) unless current_user?(@user)
   end

end

