class MerchantlikesController < ApplicationController
   before_filter :authenticate

   def create
       @merchant = Merchant.find(params[:merchantlike][:merchant_id])
       @merchant.merchantlike!(current_user)
       #redirect_to @merchant
       respond_to do |format|
          #format.js
          format.html { redirect_to @merchant }
       end
   end
   def destroy
       @sujit= Merchantlike.find(params[:id])
       @merchant = Merchant.find_by_id(@sujit.merchant_id)
       @merchant.merchantunlike!(current_user)
       #redirect_to @merchant
       respond_to do |format|
          #format.js
          format.html { redirect_to @merchant }
       end
   end

end
