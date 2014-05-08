require 'spec_helper'

feature 'Topics managment' do
  scenario 'User adds new topic' do
    visit '/topics'
    click_on 'Добавить раздел'
    fill_in 'Название', with: 'Птички'
    click_button 'Создать раздел'

    expect(page).to have_text 'Птички'
  end

  context 'as admin' do
    before do
      login
      create :topic, title: 'О птичках'
    end

    scenario 'Admin removes  topic' do

      visit '/topics'

      click_on 'О птичках'
      click_on 'Удалить'

      expect(current_path).to eq '/topics'
      expect(page).to_not have_text 'О птичках'
    end
  end
end
