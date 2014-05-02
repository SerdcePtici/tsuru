require 'spec_helper'

feature 'Albums managment' do
  let!(:topic) { create :topic }

  scenario 'User adds new album', :js do
    visit '/topics'
    click_on topic.title
    click_on 'Создать альбом...'
    fill_in 'Название', with: 'Фотографии птичек'
    attach_file 'Добавить изображение', file_fixture_path('crane.jpg')
    page.should have_selector '.uploaded_pictures img', count: 1
    click_on 'Создать альбом'

    page.should have_text 'Фотографии птичек'
    page.should have_selector '#content img', count: 1
  end

  describe 'as admin' do
    before do
      login
      create :album, topic: topic, title: 'Фотографии птичек'
    end

    scenario 'Admin removes album' do

      visit topic_path topic
      click_on 'Фотографии птичек'
      click_on 'Удалить'

      current_path.should eq topic_path topic
      page.should_not have_text 'Фотографии птичек'
    end
  end
end
