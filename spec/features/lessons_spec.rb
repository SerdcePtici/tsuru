require 'spec_helper'

feature 'Lessons managment' do
  scenario 'User adds new lesson', :js do
    visit '/lessons'
    click_on 'Создать урок'
    fill_in 'Название', with: 'Как делать птичек'
    attach_file 'Добавить изображение', file_fixture_path('crane.jpg')
    page.should have_selector '.uploaded_pictures img', count: 1
    click_on 'Создать урок'

    page.should have_text 'Как делать птичек'
    page.should have_selector '#content img', count: 1
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

      current_path.should eq '/lessons'
      page.should_not have_text 'Как делать птичек'
    end
  end
end
