# BBGlib
# create by Raecoo

require 'bbg_mail/tls/smtp_tls'
require 'bbg_mail/tls/action_mailer_tls'

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_charset = "utf-8"
ActionMailer::Base.default_content_type = 'text/html'
ActionMailer::Base.smtp_settings = {
 :address => "smtp.gmail.com",
 :domain => "beibeigan.com",
 :port => 587,
 :authentication => :plain,
 :user_name=> "webmaster@beibeigan.com",
 :password => "web.master.bbg"
}