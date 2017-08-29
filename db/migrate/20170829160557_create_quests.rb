class CreateQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
      t.string :quest_giver, null: false
      t.string :reward
      t.references :dragonborn
    end
  end
end
