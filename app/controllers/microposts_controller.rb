class MicropostsController < ApplicationController
   before_filter :authenticate, :only => [:create, :destroy]
   before_filter :authorized_user, :only => :destroy

   def create
        @micropost = current_user.microposts.build(params[:micropost])
        #@micropost = wrap(@micropost)
        if @micropost.save
        flash[:success] = "Successfully Posted"
        redirect_to current_user
        else
        @feed_items = []
        render 'pages/home'
        end
   end
 
   def destroy
       @micropost.destroy
       redirect_to root_path
   end

   private
   def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
   end

end
