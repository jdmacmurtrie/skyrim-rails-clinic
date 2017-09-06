class Quest < ApplicationRecord
  belongs_to :dragonborn
  has_many :city_quests, dependent: :destroy
  has_many :cities, through: :city_quests, dependent: :destroy
end
