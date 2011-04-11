class AttendancesController < ApplicationController
   before_filter :authenticate

   def create
       @deal = Deal.find(params[:attendance][:deal_id])
       @deal.dealattend!(current_user)
       #redirect_to @product
       respond_to do |format|
          #format.js
          format.html { redirect_to @deal }
       end
   end
   def destroy
       @sujit= Attendance.find(params[:id])
       @deal = Deal.find_by_id(@sujit.deal_id)
       @deal.dealnotattend!(current_user)
       #redirect_to @product
       respond_to do |format|
          #format.js
          format.html { redirect_to @deal }
       end
   end


end
