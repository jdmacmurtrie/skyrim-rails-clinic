require 'rails_helper'

feature 'details for a specific city' do
  let!(:urban_mission1) { FactoryGirl.create(:city_quest) }
  let!(:city) { urban_mission1.city }
  let!(:urban_mission2) { FactoryGirl.create(:city_quest, city: city) }
  let!(:dragonborn) { urban_mission1.quest.dragonborn }
  let!(:quest1) { urban_mission1.quest }
  let!(:quest2) { urban_mission2.quest }

  scenario 'user sees details' do
    visit city_path(city)

    expect(page).to have_content(city.allegiance)
    expect(page).to have_content(city.region)
    expect(page).to have_content(quest1.task)
    expect(page).to have_content(quest1.dragonborn.name)
    expect(page).to have_content(quest2.task)
    expect(page).to have_content(quest2.dragonborn.name)
  end
end
