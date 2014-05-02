require 'spec_helper'

feature 'Story comments' do
  let!(:story) { create :story }

  scenario 'User adds new comment', :js do
    visit story_path story
    fill_in 'Имя гостя', with: 'Маша'
    fill_in 'Комментарий', with: 'Супер!'
    click_on 'Отправить'

    page.should have_text 'Маша'
    page.should have_text 'Супер!'
  end

  context 'as admin' do
    before do
      login
      create :comment, author: 'Маша', commentable: story
    end

    scenario 'Admin removes comment', :js do
      visit story_path story
      page.should have_text 'Маша'
      within 'div.comment' do
        click_on 'Удалить'
      end

      current_path.should eq story_path story
      page.should_not have_text 'Маша'
    end
  end
end

feature 'Album comments' do
  let!(:album) { create :album }

  scenario 'User adds new comment', :js do
    visit album_path album
    fill_in 'Имя гостя', with: 'Маша'
    fill_in 'Комментарий', with: 'Супер!'
    click_on 'Отправить'

    page.should have_text 'Маша'
    page.should have_text 'Супер!'
  end

  context 'as admin' do
    before do
      login
      create :comment, author: 'Маша', commentable: album
    end

    scenario 'Admin removes comment', :js do
      visit album_path album
      page.should have_text 'Маша'
      within 'div.comment' do
        click_on 'Удалить'
      end

      current_path.should eq album_path album
      page.should_not have_text 'Маша'
    end
  end
end

feature 'Lesson comments' do
  let!(:lesson) { create :lesson }

  scenario 'User adds new comment', :js do
    visit lesson_path lesson
    fill_in 'Имя гостя', with: 'Маша'
    fill_in 'Комментарий', with: 'Супер!'
    attach_file 'Добавить изображение', file_fixture_path('crane.jpg')
    page.should have_selector '.uploaded_pictures img', count: 1
    click_on 'Отправить'

    page.should have_text 'Маша'
    page.should have_text 'Супер!'
    page.should have_selector '.comment img', count: 1
  end

  context 'as admin' do
    before do
      login
      create :comment, author: 'Маша', commentable: lesson
    end

    scenario 'Admin removes comment', :js do
      visit lesson_path lesson
      page.should have_text 'Маша'
      within 'div.comment' do
        click_on 'Удалить'
      end

      current_path.should eq lesson_path lesson
      page.should_not have_text 'Маша'
    end
  end
end