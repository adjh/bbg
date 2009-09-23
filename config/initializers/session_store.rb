# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nbbg_session',
  :secret      => '3a96b45be5ea2eef2b11553ec8aa347a2052029302b32337d2d31c09ecd5adf8daeeaf462b4634b14c860d53d9ed00c3d12fe91bbefa613714687be4d7bf25eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
