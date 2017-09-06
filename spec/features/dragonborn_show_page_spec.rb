require 'rails_helper'

feature 'user navigates to show page' do
  let! (:dragonborn) { Dragonborn.create(name: 'Steve',  gender: 'Female',race: 'Argonian') }
  let! (:quest1) { Quest.create(quest_giver: 'The Greybeards',task: 'Find the Horn of Jurgen Windcaller', dragonborn: dragonborn) }
  let! (:quest2) { Quest.create(quest_giver: 'Clavicus Vile', task: 'Retrieve the Rueful Axe', dragonborn: dragonborn) }
  let! (:city1) { City.create(name: 'Solitude', allegiance: 'Imperials', region: 'Haafingar') }
  let! (:city2) { City.create(name: 'Markarth', allegiance: 'Stormcloaks', region: 'The Reach') }
  let! (:urban_mission1) { CityQuest.create( quest: quest1, city: city1 )}
  let! (:urban_mission2) { CityQuest.create( quest: quest2, city: city2 )}

  scenario 'user sees all quests' do
    visit '/'
    click_on dragonborn.name

    expect(page).to have_content quest1.task
    expect(page).to have_content quest2.task
    expect(page).to have_content city1.name
    expect(page).to have_content city2.name

  end
end
