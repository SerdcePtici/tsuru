require 'spec_helper'

feature 'Topics' do
  scenario 'User adds new topic' do
    visit '/topics'
    click_on 'Добавить раздел'
    fill_in 'Название', with: 'Птички'
    click_button 'Создать раздел'

    expect(page).to have_text 'Птички'
  end

  describe 'with one topic' do
    before { create(:topic) }

    scenario 'User looks at list of topics' do

      visit '/topics'

      expect(page).to have_text 'Птички'
    end
  end
end
