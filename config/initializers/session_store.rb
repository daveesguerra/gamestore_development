# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gamestore_development_session',
  :secret      => '8439e54ddc5a0cf681179b4992e7755c2da042d755bd4d56e0d964fa9994a3267a4fb3c3069c16a5eee3c1c368f67695c66239d9dcb37a8660e7c2c9593daebd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
