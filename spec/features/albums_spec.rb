require 'spec_helper'

feature 'Albums managment' do
  let!(:topic) { create :topic }

  scenario 'User adds new album', :js do
    visit '/topics'
    click_on topic.title
    click_on 'Создать альбом...'
    fill_in 'Название', with: 'Фотографии птичек'
    attach_file 'Добавить изображения', file_fixture_path('crane.jpg')
    page.should have_selector '.uploaded_pictures img', count: 1
    click_on 'Создать альбом'

    page.should have_text 'Фотографии птичек'
    page.should have_selector '#content img', count: 1
  end

  context 'with one album' do
    let!(:album) { create :album, topic: topic, title: 'Фотографии птичек' }

    scenario 'User adds pictures to album', :js do
      pictures_count = album.pictures.count
      visit album_path album

      within '.add-pictures-form' do
        attach_file 'Добавить изображения', file_fixture_path('crane.jpg')
      end
      page.should have_selector '.uploaded_pictures img', count: 1
      click_on 'Сохранить'
      page.should have_selector '.album-pictures img', count: pictures_count + 1
    end

    context 'as admin' do
      before do
        login
      end

      scenario 'Admin removes album' do
        visit album_path album
        page.should have_text 'Фотографии птичек'
        click_on 'Удалить'

        current_path.should eq topic_path topic
        page.should_not have_text 'Фотографии птичек'
      end
    end
  end
end
