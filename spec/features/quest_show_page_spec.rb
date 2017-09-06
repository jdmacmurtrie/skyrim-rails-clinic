require 'rails_helper'

feature 'details for a specific city' do
  let! (:dragonborn) { Dragonborn.create(name: 'Steve',  gender: 'Female',race: 'Argonian') }
  let! (:quest1) { Quest.create(quest_giver: 'The Greybeards',task: 'Find the Horn of Jurgen Windcaller', dragonborn: dragonborn) }
  let! (:quest2) { Quest.create(quest_giver: 'Clavicus Vile', task: 'Retrieve the Rueful Axe', dragonborn: dragonborn) }
  let! (:city) { City.create(name: 'Solitude', allegiance: 'Imperials', region: 'Haafingar') }
  let! (:urban_mission1) { CityQuest.create( quest: quest1, city: city )}
  let! (:urban_mission2) { CityQuest.create( quest: quest2, city: city )}

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
