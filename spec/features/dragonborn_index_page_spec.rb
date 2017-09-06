require 'rails_helper'

feature 'user navigates to dragonborn index page' do
  let!(:dragonborn) { FactoryGirl.create(:dragonborn) }
  let!(:quest) { FactoryGirl.create_list(:quest, 2, dragonborn: dragonborn) }

  scenario 'user sees all dragonborn options' do
    visit '/'

    expect(page).to have_link dragonborn.name
    expect(dragonborn.quests.count).to eq 2
    expect(page).to have_content dragonborn.quests.count
    expect(page).to have_link 'Start a New Game'
  end

end
