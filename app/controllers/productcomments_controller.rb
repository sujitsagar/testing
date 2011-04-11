class ProductcommentsController < ApplicationController

   before_filter :authenticate, :only => [:create, :destroy]
   before_filter :authorized_user, :only => :destroy

   def create
        @productcomment = current_user.productcomments.build(params[:productcomment])
        #@productcomment = wrap(@productcomment)
        #@product = Product.find(params[:id])
        #@productcomment[:type] = "comment"
        #@productcomment[:product_id] = @product.id
        if @productcomment.save
        flash[:success] = "Successfully Posted"
        redirect_to Product.find(@productcomment[:product_id])
        else
        @feed_items = []
        render 'pages/home'
        end
   end
 
   def destroy
       @productcomment.destroy
       redirect_to root_path
   end

   private
   def authorized_user
      @productcomment = Productcomment.find(params[:id])
      redirect_to root_path unless current_user?(@productcomment.user)
   end
end
