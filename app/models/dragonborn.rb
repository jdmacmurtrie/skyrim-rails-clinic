class Dragonborn < ApplicationRecord
  has_many :quests

  validates :name, presence: true
  validates :gender, presence: true
  validates :race, presence: true
end
