class UploadController < ApplicationController
  layout nil
  protect_from_forgery :only => [:create, :update, :destroy ] 

  def index
     @user = User.new(params[:user])
     render :file => 'app/views/upload/uploadfile.html.erb'
  end

  def create
      @post = [];

      params[:upload].each { | id, image |
        result = Uploadfile.save(id, image);
        @post << result if result
      }

      render :file => 'app/views/upload/uploadfile.html.erb'
  end
end
