require 'json'

module RecipesHelper
  def process_file(file, user)
    contents = file.read
    data = JSON.parse contents

    if data[ 'recipes' ].count > 0
      clear_recipes_for user
    else
      raise 'File error'
    end
    Recipe.transaction do
      data[ 'recipes' ].each do |recipe|
        record = Recipe.new
        record.user = user
        record.name = recipe[ 'name' ]
        record.energy_cost = recipe[ 'energy' ]
        record.modded = true
        record.save

        recipe[ 'inputs' ].each do |name, value|
          record.ingredients.create name: name, amount: value, input: true, recipe: record
        end

        recipe[ 'outputs' ].each do |name, value|
          record.ingredients.create name: name, amount: value, input: false, recipe: record
        end
      end
    end
  end

  def clear_recipes_for(user)
    Recipe.owned_by(user).destroy_all
  end
end
