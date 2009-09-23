require 'smtp_tls'
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_charset = "utf-8"
ActionMailer::Base.smtp_settings = {
 :address => "smtp.gmail.com",
 :port => 587,
 :authentication => :plain,
 :user_name=> "raecoo@beibeigan.com",
 :password => "raecoobbg"
}