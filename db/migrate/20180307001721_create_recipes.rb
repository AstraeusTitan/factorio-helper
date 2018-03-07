class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :energy_cost, default: 0.0

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
