class UserMailer < ActionMailer::Base
  default :from => "info@likesdiary.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://likesdiary.com"
    #attachments['likes.png'] = File.read('public/images/likes.png')
    mail(:to => user.email, :subject => "Welcome to Likesdiary")
  end
  def welcome
    attachments.inline['likes.png'] = File.read('public/images/likes.png')
  end

end
