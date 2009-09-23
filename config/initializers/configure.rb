# loadd extras file
require 'core_ext'
require 'enum_attr'

## memcached setting
require 'cache_money'
require 'memcache'
unless RAILS_ENV =~ /test/
  config = YAML.load(IO.read(File.join(RAILS_ROOT, "config", "memcached.yml")))[RAILS_ENV]
  $memcache = MemCache.new(config)
  $memcache.servers = config['servers']

  ActionController::Base.session_options[:cache] = $memcache
   
  $local = Cash::Local.new($memcache)
  $lock = Cash::Lock.new($memcache)
  $cache = Cash::Transactional.new($local, $lock)

  # injection cache-money into AR
  class ActiveRecord::Base
    is_cached :repository => $cache
  end
end

# remove resource name header of the json
ActiveRecord::Base.include_root_in_json = false

# delayed job setting
Delayed::Job.destroy_failed_jobs = false
silence_warnings do
  Delayed::Job.const_set("MAX_ATTEMPTS", 3)
  Delayed::Job.const_set("MAX_RUN_TIME", 5.minutes)
end

# WillPaginate::ViewHelpers.pagination_options[:previous_label] = "前一页"
# WillPaginate::ViewHelpers.pagination_options[:next_label] = "后一页"