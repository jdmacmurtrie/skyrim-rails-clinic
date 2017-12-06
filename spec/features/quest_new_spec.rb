require 'rails_helper'

feature 'user adds a quest' do
  let!(:dragonborn) { Dragonborn.create(name: 'Rufus', race: 'Breton', gender: 'Male') }
  let!(:quest1) { Quest.create(task: 'monkey business', quest_giver: 'ur mom', dragonborn: dragonborn) }
  let!(:quest2) { Quest.create(task: 'donkey business', quest_giver: 'ur dad', dragonborn: dragonborn) }

  scenario 'user fills out form' do

    visit "/dragonborns/#{dragonborn.id}"

    expect(page).to have_content 'Add a new Quest:'

    fill_in 'Task', with: 'Kill the priest of Boethiah'
    fill_in 'Given By', with: 'Molag Bal'
    click_button 'Accept!'

    expect(page.current_path).to eq("/dragonborns/#{dragonborn.id}")
    expect(dragonborn.quests.count).to eq 3
    expect(page).to have_content 'Kill the priest of Boethiah (Given by: Molag Bal)'
    expect(page).to have_content 'New quest accepted.'
  end

end
