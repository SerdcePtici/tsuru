require 'spec_helper'

feature 'Topics managment' do
  scenario 'User adds new topic' do
    visit '/topics'
    click_on 'Добавить раздел'
    fill_in 'Название', with: 'Птички'
    click_button 'Создать раздел'

    expect(page).to have_text 'Птички'
  end

  describe 'with one topic' do
    before do
      create :topic
      login
    end

    scenario 'Admin removes  topic' do

      visit '/topics'

      click_on 'Птички'
      click_on 'Удалить'

      expect(current_path).to eq '/topics'
      expect(page).to_not have_text 'Птички'
    end
  end
end
