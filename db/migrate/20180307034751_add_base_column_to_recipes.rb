class AddBaseColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :base_game?, :boolean, default: false
  end
end
