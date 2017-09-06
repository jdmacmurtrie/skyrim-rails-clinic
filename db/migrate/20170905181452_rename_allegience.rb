class RenameAllegience < ActiveRecord::Migration[5.0]
  def change
    rename_column :cities, :allegience, :allegiance
  end
end
