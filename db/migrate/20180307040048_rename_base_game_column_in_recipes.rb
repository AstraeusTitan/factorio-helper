class RenameBaseGameColumnInRecipes < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :base_game?, :modded
    change_column_default :recipes, :modded, from: false, to: true
  end
end
