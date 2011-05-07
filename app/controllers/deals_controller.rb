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
