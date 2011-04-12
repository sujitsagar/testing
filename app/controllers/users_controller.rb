class UsersController < ApplicationController
  layout 'profile' 
  #layout "application", :except => [:new, :create ]
  #layout "signuplogin", :only  => [ :new, :create ]
  before_filter :authenticate, :except => [ :new, :create, :confirm , :confirm1]
  #before_filter :authenticate, :only => [:edit, :update, :show, :index]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def setlayout
     if :action == 'new'
            'signuplogin' and return
     else
            'application'
     end
  end
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
    render :layout => 'likesdiary'
  end

  def create
     @user = User.new(params[:user])
     @user.confirmation = String.random_alphanumeric(8)
     @user.active = 0
     if @user.save
	#UserMailer.welcome_email(@user).deliver
        #sign_in @user
        #redirect_to @user #enable it to direct sign in after sign up
        flash[:success] = "Please check your mail to activate your account"
        redirect_to root_path
     else
        @title = "Sign up"
        render 'new',:layout => 'signuplogin'
     end
     
  end

  def confirm
     @user = User.new(params[:user])
     render :layout => 'signuplogin'
  end
 
  def confirm1
    #@user = User.new(params[:user])
    @user = User.find_by_confirmation(params[:user][:confirmation])
    if @user.toggle!(:active)
        flash[:success] = "Registration successful, Please login to continue"
        redirect_to root_path
    else 
        render 'confirm'
    end
  end

  def new
    @user= User.new
    @title = "Sign up page"
    if signed_in?
	redirect_to current_user 
    else
	render :layout => "signuplogin"
    end
  end
  
  def show
    @user = User.find(params[:id])
    @productlikes = @user.productlikes
    @title = @user.name
    #@ppe= Micropost.new
    render :layout => 'profile'
    
  end 
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
    render :layout => 'likesdiary'
  end
   
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
    
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def upload
    @user = current_user.params[:user]
  end

  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page], :per_page => 24)
    render 'show_follow'
    #render :layout => 'userprofile' 
  end
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page], :per_page => 24)
    render 'show_follow'
    #render :layout => 'userprofile' 
  end
  def products
    @title = "Products"
    @user = User.find(params[:id])
    @products = @user.productlikes.paginate(:page => params[:page], :per_page => 32)
    render 'show_userproductlike'
  end
  def deals
    @title = "Deals"
    @user = User.find(params[:id])
    @deals = @user.deals
    @cities =  City.all
    @alldeals = Deal.all
    render 'show_userdealattend'
  end
  def merchants
    @title = "Merchants"
    @user = User.find(params[:id])
    @merchants = @user.merchants.paginate( :page => params[:page], :per_page => 32)
    @cities =  City.all
    @allmerchants = Merchant.all
    render 'show_usermerchantlike', :layout => 'cheapsdiary'

  end

  private
     
     def checksignin
       redirect_to(cheapsdiary_path) if signed_in?
     end
     
     def correct_user
       @user = User.find(params[:id])
       redirect_to(root_path) unless current_user?(@user)
     end
     def admin_user
       @user = User.find(params[:id])
       redirect_to(users_path) unless current_user.admin?
     end  
    def String.random_alphanumeric(size=16)
  	s = ""
  	size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  	s
    end
end
