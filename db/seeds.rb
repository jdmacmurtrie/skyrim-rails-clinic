# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dragonborn.destroy_all
Quest.destroy_all

Dragonborn.create(
  [
    {name: 'Bugdulg Logob', gender: 'Male', race: 'Orc'},
    {name: 'Fillim', gender: 'Female', race: 'Wood Elf'},
  ]
)
Quest.create(
  [
    {
      quest_giver: 'The Greybeards',
      task: 'Find the Horn of Jurgen Windcaller',
      dragonborn: Dragonborn.find_by(name: 'Bugdulg Logob')
    },
    {
      quest_giver: 'Clavicus Vile',
      task: 'Retrieve the Rueful Axe',
      dragonborn: Dragonborn.find_by(name: 'Bugdulg Logob')
    }
  ]
)
