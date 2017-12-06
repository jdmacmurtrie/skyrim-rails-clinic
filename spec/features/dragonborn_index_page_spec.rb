require 'rails_helper'

feature 'user navigates to dragonborn index page' do
  let!(:dragonborn) { Dragonborn.create(name: 'Jack', race: 'Orc', gender: 'Male') }
  let!(:quest1) { Quest.create(task: "monkey around", quest_giver: 'ur mom', dragonborn: dragonborn) }
  let!(:quest2) { Quest.create(task: "zebra around", quest_giver: 'ur dad', dragonborn: dragonborn) }

  scenario 'user sees all dragonborn options' do
    visit '/'

    expect(page).to have_link dragonborn.name
    expect(dragonborn.quests.count).to eq 2
    expect(page).to have_content dragonborn.quests.count
    expect(page).to have_link 'Start a New Game'
  end

end
