class MerchantsController < ApplicationController
  layout 'likesdiary'
  before_filter :authenticate
  before_filter :admin_user, :only => [ :edit , :new, :create, :update, :destroy ]

  def index
    @merchants = Merchant.all
    @users = User.all
  end

  def show
    @merchant = Merchant.find(params[:id])
    @merchantcomment = current_user.merchantcomments.build(params[:merchantcomment])
    @merchantcomments1 = Merchantcomment.where("merchant_id=?", params[:id]).order('created_at DESC')
    @merchantcomments = @merchantcomments1.paginate(:page => params[:page])
    
    @title = @merchant.merchantname 
    @merchants = @merchant.users
  end

  def new
    @merchant = Merchant.new
  end


  def edit
    @merchant = Merchant.find(params[:id])
  end

  def create
    @merchant = Merchant.new(params[:merchant])
      if @merchant.save
        redirect_to(@merchant, :notice => 'Merchant was successfully created.') 
      else
        render :action => "new" 
      end
  end

  def update
    @merchant = Merchant.find(params[:id])
    if @merchant.update_attributes(params[:merchant])
        redirect_to(@merchant)
        flash[:notice] = 'Merchant was successfully updated.' 
    else
        render :action => "edit"
    end
  end

  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy
    redirect_to(merchants_url) 

  end
end
