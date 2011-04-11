class ProductsController < ApplicationController
    layout 'cheapsdiary'
    #layout nil
    before_filter :authenticate
    #before_filter :authenticate, :except => [:show, :new, :create]
    #before_filter :authenticate, :only => [:edit, :update, :show, :index]
    before_filter :correct_puser, :only => [:edit, :update, :destroy]
    #before_filter :admin_user, :only => :destroy  
  def index
    @products = Product.all
    @users = User.all
  end

  def show
    @productcomment = current_user.productcomments.build(params[:productcomment])
    @product = Product.find(params[:id])
    @productcomments1 = Productcomment.where("product_id=?", params[:id]).order('created_at DESC')
    @productcomments = @productcomments1.paginate(:page => params[:page])
    @user = User.find(@product.user_id)
    @title = @product.productname 
    @products = @product.users
    @subgroup = Subgroup.find(@product.subgroup_id)
    @maingroup = Maingroup.find_by_id(@subgroup.maingroup_id)
  end

 
  def new
    @product = Product.new
  end

   def edit
    @product = Product.find(params[:id])
  end

  def create
    #@micropost = current_user.microposts.build(params[:micropost])
    @product = current_user.products.build(params[:product])

     if @product.save
         redirect_to @product
         flash[:success] = "Product was successfully created."
     else
         render :action => "new" 
     end
    
  end

  def update
    @product = Product.find(params[:id])

    
      if @product.update_attributes(params[:product])
        redirect_to @product 
        flash[:success] = "Product Info was successfully updated."
      else
        render :action => "edit"
      end
    
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product successfully deleted."
    redirect_to(products_url)
  end
  
  def users
    @title = "Users"
    @product = Product.find(params[:id])
    @products = @product.users.paginate(:page => params[:page])
    
    render 'show_productlike'
  end
  private
  def correct_puser
       @product = Product.find(params[:id])
       @user = User.find (@product.user_id)
       
       if !current_user?(@user) && !current_user.admin? #verify this condition again
         flash[:error] = "Sorry. You can't delete/edit this Product"
         redirect_to(products_path)
       end
       #redirect_to(root_path) unless current_user?(@user)
         
   end
end
