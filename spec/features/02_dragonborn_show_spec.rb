require 'rails_helper'

feature 'user navigates to show page' do
  let!(:dragonborn) { FactoryBot.create(:dragonborn) }
  let!(:quest) { FactoryBot.create_list(:quest, 2, dragonborn: dragonborn) }

  scenario 'user sees all quests' do
    visit "/dragonborns/#{dragonborn.id}"

    expect(page).to have_content quest.first.task
    expect(page).to have_content quest.last.task


  end
end
