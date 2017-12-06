require 'rails_helper'

feature 'user navigates to show page' do
  let!(:urban_mission1) { CityQuest.create(city: city1, quest: quest1 )}
  let!(:urban_mission2) { CityQuest.create(city: city2, quest: quest2 )}
  let!(:dragonborn) { Dragonborn.create(name: 'Rufus', race: 'Breton', gender: 'Male') }
  let!(:quest1) { Quest.create(task: 'monkey business', quest_giver: 'ur mom', dragonborn: dragonborn) }
  let!(:quest2) { Quest.create(task: 'donkey business', quest_giver: 'ur dad', dragonborn: dragonborn) }
  let!(:city1) { City.create(name: "Philadelphia", allegiance: 'Imperials', region: 'Atlantic NE') }
  let!(:city2) { City.create(name: "Boston", allegiance: 'Stormcloaks', region: 'Atlantic NE') }

  scenario 'user sees all quests' do
    visit '/'
    click_on dragonborn.name

    expect(page).to have_content quest1.task
    expect(page).to have_content quest2.task
    expect(page).to have_content city1.name
    expect(page).to have_content city2.name

  end
end
