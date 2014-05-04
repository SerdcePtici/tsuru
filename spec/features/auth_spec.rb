require 'spec_helper'

feature 'Authorization' do

  context 'one user is registered' do
    let(:email) { 'admin@example.com' }
    let(:password) { '12345678' }
    before { create :admin, email: email, password: password }

    scenario 'Log in' do

      visit '/users/sign_in'

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_on 'Sign in'

      expect(page).to have_content 'Вход в систему выполнен.'
    end
  end

  context 'when logged in' do
    before { login }

    scenario 'Log out' do

      visit '/'
      click_on 'Выйти'

      expect(page).to have_content 'Выход из системы выполнен.'
    end
  end
end
