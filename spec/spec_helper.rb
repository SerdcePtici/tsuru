# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller

  # Configure capybara
  require 'capybara/rspec'
  Capybara.javascript_driver = :webkit

  config.around :each, :selenium do |example|
    Capybara.current_driver = :selenium
    example.run
    Capybara.use_default_driver
  end

  default_crean_strategy = :transaction
  # Configure DatabaseCleaner
  config.before :suite do
    DatabaseCleaner.strategy = default_crean_strategy
    DatabaseCleaner.clean_with :truncation
  end

  js_clean = proc do |example|
    DatabaseCleaner.strategy = :truncation
    example.run
    DatabaseCleaner.strategy = default_crean_strategy
  end

  config.around :each, :js, &js_clean
  config.around :each, :selenium, &js_clean

  config.around :each do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end

  # Include custom helpers
  Dir[Rails.root.join('spec/helpers/*.rb')].each {|f| require f}
  config.include CapybaraAuthHelpers, type: :feature
  config.include GlobalHelpers
  FactoryGirl::SyntaxRunner.send(:include, GlobalHelpers)

  # Cleanup carrierwave uploads
  config.after(:all) do
    if Rails.env.test?
      FileUtils.rm_rf(CarrierWave::Uploader::Base.root)
    end
  end

end
