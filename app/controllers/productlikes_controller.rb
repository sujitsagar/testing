class ProductlikesController < ApplicationController
   #layout 'afterlogin'
   before_filter :authenticate

   def create
       @product = Product.find(params[:productlike][:product_id])
       @product.productlike!(current_user)
       #redirect_to @product
       respond_to do |format|
          #format.js
          format.html { redirect_to (:back) }
       end
   end
   def destroy
       @sujit= Productlike.find(params[:id])
       @product = Product.find_by_id(@sujit.product_id)
       @product.productunlike!(current_user)
       #redirect_to @product
       respond_to do |format|
          #format.js
          format.html { redirect_to (:back) }
       end
   end

end
