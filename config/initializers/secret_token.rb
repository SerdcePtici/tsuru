# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Tsuru::Application.config.secret_key_base = '1e684650186debf12a09ef9ae154baefe231fe317324b0ec1e4a488d66fc60a0a6802caf3004a6fb16e4cce4df2d37981df4841812218924934198b560662858'
