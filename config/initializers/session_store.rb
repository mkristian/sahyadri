# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sahyadri_session',
  :secret      => '32b0fa15374028863d2804bf9dccbaae04b58824f4eebe1d2ced58f902ed8d029c6824341f21737ff91d3fd65f79cf6c8ce62f41cfe041f6b5007f80759ad454'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
