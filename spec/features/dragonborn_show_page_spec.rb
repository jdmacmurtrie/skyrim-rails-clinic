require 'rails_helper'

feature 'user navigates to show page' do
  let!(:urban_mission1) { FactoryGirl.create(:city_quest)}
  let!(:urban_mission2) { FactoryGirl.create(:city_quest)}
  let!(:dragonborn) { urban_mission1.quest.dragonborn }
  let!(:quest1) { urban_mission1.quest }
  let!(:quest2) { urban_mission2.quest }
  let!(:city1) { urban_mission1.city }
  let!(:city2) { urban_mission2.city }

  scenario 'user sees all quests' do
    visit '/'
    click_on dragonborn.name

    expect(page).to have_content quest1.task
    expect(page).to have_content quest2.task
    expect(page).to have_content city1.name
    expect(page).to have_content city2.name

  end
end
