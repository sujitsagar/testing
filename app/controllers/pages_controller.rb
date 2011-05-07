class PagesController < ApplicationController
  layout 'likesdiary'
  before_filter :authenticate
  
  def home
    @user= current_user
    @title = "Home"
    if signed_in?
       #@feed_items1 = current_user.feed
       @feed_items = current_user.profeed.paginate(:page => params[:page], :per_page => 5)
       #@feed_itemstot1 = @feed_items1 && @feed_items2
       #@feed_itemstot = @feed_itemstot1.order('created_at DESC') 
       #@feed_items2 = @feed_items2.paginate(:page => params[:page])
    end

  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  def likestat
    @products = Product.all
    @title = "Likes stats"
    #arr = [1..10]
    @user = current_user
    #@products = @users.products
  end

end
