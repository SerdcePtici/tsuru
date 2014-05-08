CarrierWave.configure do |config|
  config.root = File.join(Rails.root, 'public', Rails.env)
  config.base_path = "/#{Rails.env}"
end