class ConfirmMailer < ActionMailer::Base
  default :from => "info@likesdiary.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/confirmation/"
    #attachments['likes.png'] = File.read('public/images/likes.png')
    mail(:to => user.email, :subject => "Welcome to Likesdiary")
  end
end
