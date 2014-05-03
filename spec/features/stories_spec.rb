require 'spec_helper'

feature 'Stories managment' do
  scenario 'User adds new story', :js do
    visit '/stories'
    click_on 'Рассказать историю'
    fill_in 'Рассказчик', with: 'Вася Пупкин'
    fill_in 'Название', with: 'Супер история'
    fill_in 'Ваша история', with: 'Тут какой-то текст'
    attach_file 'Добавить изображения', file_fixture_path('crane.jpg')
    attach_file 'Добавить изображения', file_fixture_path('crane.jpg')
    expect(page).not_to have_text 'Добавить изображения'
    expect(page).to have_selector '.uploaded_pictures img', count: 2
    click_on 'Отправить'

    expect(page).to have_text 'Супер история'
    expect(page).to have_text 'Рассказчик: Вася Пупкин'
    expect(page).to have_text 'Тут какой-то текст'
    expect(page).to have_selector '#content img', count: 2
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
      expect(page).to_not have_text 'Птички'
    end
  end
end
