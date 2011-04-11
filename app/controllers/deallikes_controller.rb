class DeallikesController < ApplicationController
   #layout 'afterlogin'
   before_filter :authenticate

   def create
       @deal = Deal.find(params[:deallike][:deal_id])
       @deal.deallike!(current_user)
       #redirect_to @deal
       respond_to do |format|
          #format.js
          format.html { redirect_to @deal }
       end
   end
   def destroy
       @sujit= Deallike.find(params[:id])
       @deal = Deal.find_by_id(@sujit.deal_id)
       @deal.dealunlike!(current_user)
       #redirect_to @deal
       respond_to do |format|
          #format.js
          format.html { redirect_to @deal }
       end
   end
end
