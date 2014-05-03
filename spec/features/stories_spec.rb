require 'spec_helper'

feature 'Stories managment' do
  scenario 'User adds new story', :js do
    visit '/stories'
    click_on 'Рассказать историю'
    fill_in 'Рассказчик', with: 'Вася Пупкин'
    fill_in 'Название', with: 'Супер история'
    fill_in 'Ваша история', with: 'Тут какой-то текст'
    attach_file 'Добавить изображения', file_fixture_path('crane.jpg')
    page.should have_selector '.uploaded_pictures img', count: 1
    click_on 'Отправить'

    page.should have_text 'Супер история'
    page.should have_text 'Рассказчик: Вася Пупкин'
    page.should have_text 'Тут какой-то текст'
    page.should have_selector '#content img', count: 1
  end

  context 'with one story' do
    before do
      create :story
      login
    end


    scenario 'Admin removes story' do

      visit '/stories'
      click_on 'Птички'
      click_on 'Удалить'

      current_path.should eq '/stories'
      page.should_not have_text 'Птички'
    end
  end
end
