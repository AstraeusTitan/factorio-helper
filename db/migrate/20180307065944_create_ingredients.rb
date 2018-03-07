class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :amount, default: 1
      t.boolean :input, default: true

      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
