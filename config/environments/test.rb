config.cache_classes = true
# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true
# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true
# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test
# config.active_record.schema_format = :sql
config.gem "webrat",  :lib => false
config.gem 'thoughtbot-factory_girl', :lib => false
config.gem 'thoughtbot-shoulda',  :lib => false