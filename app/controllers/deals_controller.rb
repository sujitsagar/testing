class DealsController < ApplicationController
    layout 'cheapsdiary'
    before_filter :authenticate, :except => [ :attendees ]
    #before_filter :authenticate, :except => [:show, :new, :create]
    #before_filter :authenticate, :only => [:edit, :update, :show, :index]
    before_filter :admin_user,:only => [ :new, :index, :edit, :create, :update ]
  def index
    @deals = Deal.all
    #@cities = City.all
  end

 
  def show
    @deal = Deal.find(params[:id])
    #@cities = City.all
    @deals = @deal.users
  end

  def currentdeal
    @deal = Deal.first
    @deals =  @deal.users
    render 'show'
  end

  def new
    @deal = Deal.new
    @cities= City.all
    
  end

  def edit
    @deal = Deal.find(params[:id])
    @cities= City.all
  end

  def create
    
    @deal = Deal.new(params[:deal])
    @deal.city_id = params[:deal][:city_id]
    @deal.image = params[:deal][:image]
    @deal.orignalprice  = params[:deal][:orignalprice]
    @deal.discount  = params[:deal][:discount]
    @deal.maxattenders  = params[:deal][:maxattenders]
    @deal.info1  = params[:deal][:info1]
    @deal.terms  = params[:deal][:terms]
    @deal.aboutdeal  = params[:deal][:aboutdeal]
    @deal.info2  = params[:deal][:info2]
    @deal.address  = params[:deal][:address]
    @deal.startat = DateTime.civil(params[:deal]["startat(1i)"].to_i,params[:deal]["startat(2i)"].to_i,params[:deal]["startat(3i)"].to_i,params[:deal]["startat(4i)"].to_i,params[:deal]["startat(5i)"].to_i)
    @deal.endat = DateTime.civil(params[:deal]["endat(1i)"].to_i,params[:deal]["endat(2i)"].to_i,params[:deal]["endat(3i)"].to_i,params[:deal]["endat(4i)"].to_i,params[:deal]["endat(5i)"].to_i)
   if @deal.save
       redirect_to @deal
       flash[:success] = 'Deal was successfully created.'
   else
        render :action => "new" 
   end

  end


  def update
    @deal = Deal.find(params[:id])


      if @deal.update_attributes(params[:deal])
        redirect_to @deal 
        flash[:success] = 'Deal was successfully updated.' 

      else
        render :action => "edit" 

      end

  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    flash[:success] = "Deal deleted"
    redirect_to(deals_url)
  end

  def attendees
    @title = "Attendees"
    @deal = Deal.find(params[:id])
    @deals = @deal.users.paginate(:page => params[:page])
    
    render 'show_dealattend'
  end
end
