# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_tr3w_time_and_expenses_session',
  :secret => '374bd4d37eb4ae388b6593b081b1fcd4339240f3d939928677607cb5f85954b66632733d359b65ab85f101a96dba9d9fa2453a832005756e6c241fb9b1f810b1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
