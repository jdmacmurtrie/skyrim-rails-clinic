class RenameRewardInQuests < ActiveRecord::Migration[5.0]
  def change
    rename_column :quests, :reward, :task
  end
end
