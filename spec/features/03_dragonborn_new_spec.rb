require 'rails_helper'

feature 'user starts new game' do
  scenario 'user fills out form' do
    visit '/'
    click_link 'Start a New Game'

    expect(page).to have_content 'Create a New Character'

    fill_in 'Name', with: 'Anaril'
    fill_in 'Race', with: 'High Elf'
    fill_in 'Gender', with: 'Female'
    click_button 'Begin!'

    expect(page.current_path).to eq('/dragonborns')
    expect(page).to have_content 'Anaril [High Elf - Female]'
    expect(page).to have_content 'A new Dragonborn has appeared.'
  end

  scenario 'user fudges up form' do
    visit '/dragonborns/new'

    # fill_in 'Name', with: 'Anaril'
    # fill_in 'Race', with: 'High Elf'

    click_button 'Begin!'
    expect(page).to_not have_content 'A new Dragonborn has appeared.'
    expect(page).to have_content "can't be blank"
  end
end
