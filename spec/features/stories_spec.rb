require 'spec_helper'

feature 'Stories managment' do
  scenario 'User adds new story' do
    visit '/stories'
    click_on 'Рассказать историю'
    fill_in 'Рассказчик', with: 'Вася Пупкин'
    fill_in 'Название', with: 'Супер история'
    fill_in 'Ваша история', with: 'Тут какой-то текст'
    click_on 'Отправить'

    expect(page).to have_text 'Супер история'
    expect(page).to have_text 'Рассказчик: Вася Пупкин'
    expect(page).to have_text 'Тут какой-то текст'
  end

  describe 'with one topic' do
    before do
      create :story
      login
    end


    scenario 'Admin removes story' do

      visit '/stories'
      click_on 'Птички'
      click_on 'Удалить'

      expect(current_path).to eq '/stories'
      expect(page).to_not have_text 'Птички'
    end
  end
end
