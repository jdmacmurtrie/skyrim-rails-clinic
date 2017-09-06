require 'rails_helper'

feature 'user navigates to dragonborn index page' do
  let!(:dragonborn) { Dragonborn.create(name: 'Steve', gender: 'Female', race: 'Argonian')}
  let! (:quest1) { Quest.create(quest_giver: 'The Greybeards',task: 'Find the Horn of Jurgen Windcaller', dragonborn: dragonborn) }
  let! (:quest2) { Quest.create(quest_giver: 'Clavicus Vile', task: 'Retrieve the Rueful Axe', dragonborn: dragonborn) }

  scenario 'user sees all dragonborn options' do
    visit '/'

    expect(page).to have_link dragonborn.name
    expect(dragonborn.quests.count).to eq 2
    expect(page).to have_content dragonborn.quests.count
    expect(page).to have_link 'Start a New Game'
  end

end
