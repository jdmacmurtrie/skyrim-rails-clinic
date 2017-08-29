class CreateDragonborn < ActiveRecord::Migration[5.0]
  def change
    create_table :dragonborns do |t|
      t.string :name, null: false
      t.string :race, null: false
      t.string :gender, null: false
    end
  end
end
