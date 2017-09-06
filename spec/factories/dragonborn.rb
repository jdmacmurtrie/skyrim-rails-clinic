FactoryGirl.define do
  factory :dragonborn do
    sequence(:name) { |n| "John#{n}" } 
    gender  "Male"
    race "Wood Elf"
  end
end
