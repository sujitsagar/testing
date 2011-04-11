class MerchantcommentsController < ApplicationController

   before_filter :authenticate, :only => [:create, :destroy]
   before_filter :authorized_user, :only => :destroy

   def create
        @merchantcomment = current_user.merchantcomments.build(params[:merchantcomment])
        #@merchantcomment = wrap(@merchantcomment)
        #@product = Product.find(params[:id])
        #@merchantcomment[:type] = "comment"
        #@merchantcomment[:product_id] = @product.id
        if @merchantcomment.save
        flash[:success] = "Successfully Posted"
        redirect_to Merchant.find(@merchantcomment[:merchant_id])
        else
        @feed_items = []
        render 'pages/home'
        end
   end
 
   def destroy
       @merchantcomment.destroy
       redirect_to root_path
   end

   private
   def authorized_user
      @merchantcomment = Merchantcomment.find(params[:id])
      redirect_to root_path unless current_user?(@merchantcomment.user)
   end

end
