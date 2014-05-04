module FeatureHelpers
  def login
    auth_data = attributes_for :admin
    create :admin, auth_data

    visit '/users/sign_in'
    fill_in 'Email', with: auth_data[:email]
    fill_in 'Password', with: auth_data[:password]
    click_on 'Sign in'
  end

  def take_screenshot
    file = "/tmp/#{Time.now.to_i}.png"
    page.save_screenshot file, full: true
    require 'launchy'
    Launchy.open file
  end
end