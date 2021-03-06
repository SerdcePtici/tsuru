require 'spec_helper'

feature 'Lessons managment' do
  scenario 'User adds new lesson', :js do
    visit '/lessons'
    click_on 'Создать урок'
    fill_in 'Название', with: 'Как делать птичек'
    attach_file 'Добавить изображения', file_fixture_path('crane.jpg')
    expect(page).to have_selector '.uploaded_pictures img', count: 1
    click_on 'Создать урок'

    expect(page).to have_text 'Как делать птичек'
    expect(page).to have_selector '#content img', count: 1
  end

  context 'as admin' do
    before do
      login
      create :lesson
    end

    scenario 'Admin removes lesson' do

      visit '/lessons'
      click_on 'Как делать птичек'
      click_on 'Удалить'

      expect(current_path).to eq '/lessons'
      expect(page).to_not have_text 'Как делать птичек'
    end
  end
end
