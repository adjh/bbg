# RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  config.gem 'authlogic', :lib => 'haml', :source => 'http://gems.github.com'
  config.gem 'haml',      :lib => 'haml', :source => 'http://gems.github.com'
  config.gem 'paperclip', :lib => 'paperclip',     :source => 'http://gems.github.com'
  config.gem 'will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
  
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  config.time_zone = 'UTC'

  # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :zh
end