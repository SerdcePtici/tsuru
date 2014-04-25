module CapybaraAuthHelpers
  def login
    auth_data = attributes_for :admin
    create :admin, auth_data

    visit '/admin/sign_in'
    fill_in 'Email', with: auth_data[:email]
    fill_in 'Password', with: auth_data[:password]
    click_on 'Sign in'
  end
end