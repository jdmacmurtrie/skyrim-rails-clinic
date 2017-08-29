class Quest < ApplicationRecord
  belongs_to :dragonborn
  has_many :objectives
end
