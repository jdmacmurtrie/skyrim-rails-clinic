class City < ApplicationRecord
  has_many :city_quests, dependent: :destroy
  has_many :quests, through: :city_quests, dependent: :destroy
end
