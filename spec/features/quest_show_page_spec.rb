require 'rails_helper'

feature 'details for a specific city' do
  let!(:urban_mission1) { CityQuest.create(city: city, quest: quest1 )}
  let!(:urban_mission2) { CityQuest.create(city: city, quest: quest2 )}
  let!(:city) { City.create(name: "Philadelphia", allegiance: 'Imperials', region: 'Atlantic NE') }
  let!(:dragonborn) { Dragonborn.create(name: 'Rufus', race: 'Breton', gender: 'Male') }
  let!(:quest1) { Quest.create(task: 'monkey business', quest_giver: 'ur mom', dragonborn: dragonborn) }
  let!(:quest2) { Quest.create(task: 'donkey business', quest_giver: 'ur dad', dragonborn: dragonborn) }

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
