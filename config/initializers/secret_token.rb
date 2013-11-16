# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
DevpointLabs::Application.config.secret_token = ENV['SECRET_TOKEN']
DevpointLabs::Application.config.secret_token = "90e5e64c9691c5c659f44d818f8e761c716ff5f6cc29d9472567e274a2e2802c7189f2847a1477d3935cd339531b3404a231bb3d3296cd18e07e20ec2187a475" if Rails.env.test? # Adds this for Travis
