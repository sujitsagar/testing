# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Final::Application.initialize!


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :tls => true,
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "likesdiary.com",
    :authentication => :plain,
    :user_name => "sujitsagar.iitk",
    :password => "ramanujan"
  }