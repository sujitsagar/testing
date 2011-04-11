class MaingroupsController < ApplicationController
  layout 'likesdiary'
  before_filter :authenticate


  def index
    if params[:id].nil? 
           params[:id] = 2
    end 
    @user= current_user
    @maingroups = Maingroup.all
    @users = User.all
    @maingroup = Maingroup.find(params[:id])
    #@user = User.find(@product.user_id)
    @title = @maingroup
    #@products = @product.users
    
    @subgroups = Subgroup.where("maingroup_id = ?",params[:id])
  end

  def show
   @user= current_user
   @maingroups = Maingroup.all
    @users = User.all
    @maingroup = Maingroup.find(params[:id])
    #@user = User.find(@product.user_id)
    @title = @maingroup.maingroup
    #@products = @product.users
    @subgroups = Subgroup.where("maingroup_id =?",params[:id]).order('subgroup')
  end

 
  def new
    @maingroup = Product.new
  end

   def edit
    @maingroup = Product.find(params[:id])
  end

  def create
    #@micropost = current_user.microposts.build(params[:micropost])
    @maingroup = current_user.maingroups.build(params[:maingroup])

     if @maingroup.save
         redirect_to @maingroup
         flash[:success] = "Product was successfully created."
     else
         render :action => "new" 
     end
    
  end

  # PUT /maingroups/1
  # PUT /maingroups/1.xml
  def update
    @maingroup = Maingroup.find(params[:id])

    
      if @maingroup.update_attributes(params[:maingroup])
        redirect_to @maingroup 
        flash[:success] = "Product Info was successfully updated."
      else
        render :action => "edit"
      end
    
  end


  def destroy
    @maingroup = Maingroup.find(params[:id])
    @maingroup.destroy
    flash[:success] = "Product successfully deleted."
    redirect_to(maingroups_url)
  end
  

end
