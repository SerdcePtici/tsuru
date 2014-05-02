require 'spec_helper'

feature 'Pictures managment' do
  scenario 'Multiple pictures attach', :js do
    visit '/lessons'
    click_on 'Создать урок'
    fill_in 'Название', with: 'Как делать птичек'
    attach_file 'Добавить изображение', file_fixture_path('crane.jpg')
    attach_file 'Добавить изображение', file_fixture_path('crane.jpg')
    page.should have_selector '.uploaded_pictures img', count: 2
    click_on 'Создать урок'

    page.should have_text 'Как делать птичек'
    page.should have_selector '#content img', count: 2
  end

end
