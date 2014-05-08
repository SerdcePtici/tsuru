require 'spec_helper'

# Test this with JS
feature 'Lesson comments', :js do
  let!(:lesson) { create :lesson }

  scenario 'User adds new comment' do
    visit lesson_path lesson
    fill_in 'Имя гостя', with: 'Маша'
    fill_in 'Комментарий', with: 'Супер!'
    attach_file 'Добавить изображения', file_fixture_path('crane.jpg')
    expect(page).not_to have_text 'Добавить изображения'
    expect(page).to have_selector '.uploaded_pictures img', count: 1
    click_on 'Отправить'

    within 'div.comments-list' do
      expect(page).to have_text 'Маша'
      expect(page).to have_text 'Супер!'
      expect(page).to have_selector '.comment img', count: 1
    end
  end

  context 'as admin' do
    before do
      login
      create :comment, author: 'Маша', commentable: lesson
    end

    scenario 'Admin removes comment' do
      visit lesson_path lesson
      expect(page).to have_text 'Маша'
      within 'div.comment' do
        click_on 'Удалить'
      end

      current_path.should eq lesson_path lesson
      expect(page).to_not have_text 'Маша'
    end
  end
end

feature 'Story comments' do
  let!(:story) { create :story }

  scenario 'User adds new comment' do
    visit story_path story
    fill_in 'Имя гостя', with: 'Маша'
    fill_in 'Комментарий', with: 'Супер!'
    click_on 'Отправить'

    within 'div.comments-list' do
      expect(page).to have_text 'Маша'
      expect(page).to have_text 'Супер!'
    end
  end

  context 'as admin' do
    before do
      login
      create :comment, author: 'Маша', commentable: story
    end

    scenario 'Admin removes comment' do
      visit story_path story
      expect(page).to have_text 'Маша'
      within 'div.comment' do
        click_on 'Удалить'
      end

      current_path.should eq story_path story
      expect(page).to_not have_text 'Маша'
    end
  end
end

feature 'Album comments' do
  let!(:album) { create :album }

  scenario 'User adds new comment' do
    visit album_path album
    fill_in 'Имя гостя', with: 'Маша'
    fill_in 'Комментарий', with: 'Супер!'
    click_on 'Отправить'

    within 'div.comments-list' do
      expect(page).to have_text 'Маша'
      expect(page).to have_text 'Супер!'
    end
  end

  context 'as admin' do
    before do
      login
      create :comment, author: 'Маша', commentable: album
    end

    scenario 'Admin removes comment' do
      visit album_path album
      expect(page).to have_text 'Маша'
      within 'div.comment' do
        click_on 'Удалить'
      end

      current_path.should eq album_path album
      expect(page).to_not have_text 'Маша'
    end
  end
end