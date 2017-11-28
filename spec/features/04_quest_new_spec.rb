require 'rails_helper'

feature 'user adds a quest' do
  scenario 'user fills out form' do
    let!(:dragonborn) { FactoryBot.create(:dragonborn) }
    let!(:quest) { FactoryBot.create_list(:quest, 2, dragonborn: dragonborn) }

    visit "/dragonborns/#{dragonborn.id}"

    expect(page).to have_content 'Add a new Quest:'
    expect(page).to have_selector("input", :value =>"Task")
    expect(page).to have_selector("input", :value =>"Given By")

    fill_in 'Task', with: 'Kill the priest of Boethiah'
    fill_in 'Given By', with: 'Molag Bal'
    click_button 'Accept!'

    expect(page.curent_path).to eq("/dragonborns/#{dragonborn.id}")
    expect(dragonborn.quests.count).to eq 3
    expect(page).to have_content '3. Kill the priest of Boethiah (Given by: Molag Bal)'
    expect(page).to have_content 'Quest Added'
  end

end
