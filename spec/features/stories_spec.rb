require 'spec_helper'

feature 'Stories' do
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
    before { create :story }

    scenario 'User looks at list of stories' do

      visit '/stories'

      expect(page).to have_text 'Птички'
    end
  end
end
