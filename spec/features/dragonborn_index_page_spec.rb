require 'rails_helper'

feature 'user navigates to dragonborn index page' do
  let!(:dragonborn) { Dragonborn.create(name: 'Steve', gender: 'Female', race: 'Argonian')}

  scenario 'user sees all dragonborn options' do
    visit '/'

    expect(page).to have_link dragonborn.name
    expect(page).to have_link 'Start a New Game'
  end

end
