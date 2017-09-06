class CityQuest < ApplicationRecord
  belongs_to :quest
  belongs_to :city
end
