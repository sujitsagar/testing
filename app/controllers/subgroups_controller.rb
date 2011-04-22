class SubgroupsController < ApplicationController
  layout 'likesdiary'
  before_filter :authenticate


  def index
    @subgroups = Subgroup.all
    @users = User.all
  end

  def show
    @maingroups = Maingroup.all
    @subgroup = Subgroup.find(params[:id])
    @maingroup = Maingroup.find_by_id(@subgroup.maingroup_id)
    #@user = User.find(@product.user_id)
    @title = @subgroup
    #@products = @product.users
    @products = Product.where("subgroup_id = ?",params[:id])
  end

 
  def new
    @subgroup = Subgroup.new
    @maingroups=  Maingroup.all
  end

   def edit
    @product = Product.find(params[:id])
  end

  def create
    #@micropost = current_user.microposts.build(params[:micropost])
    @subgroup = Subgroup.new(params[:subgroup])

     if @subgroup.save
         redirect_to (:back)
         flash[:success] = "Subgroup was successfully created."
     else
         render :action => "new" 
     end
    
  end

  # PUT /products/1
  # PUT /products/1.xml
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

  def dynamic_subgroups
    @subgroups = Subgroup.all
  end


end
