# BBG common libary
# create by Raecoo

require 'core_ext/string'
require 'core_ext/symbol'
require 'bbg_helper/assets'
require 'bbg_auth/authentication'
require 'bbg_ext/enum_attr'
require 'bbg_mail/mailer'


ActionView::Base.send :include, BbgHelper::Assets
ActionView::Base.send :include, BbgAuth::Authentication
ActionController::Base.send :include, BbgAuth::Authentication

Object.send :include, EnumAttr::Mixin