class CreateCityQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :city_quests do |t|
      t.references :city
      t.references :quest
    end
  end
end
