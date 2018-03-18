# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'json'

# Seed admin
User.destroy_all

admin = User.new
admin.email = 'astraeusdev@gmail.com'
admin.password = 'Qp7Al4Zm1'
puts admin.save

# Seed recipes with base recipes
Recipe.owned_by(admin).destroy_all

file = File.read(Rails.root.join('db', 'seeds', 'recipe_seed_data.json'))
data = JSON.parse file

puts data[ 'recipes' ].count
Recipe.transaction do
  data[ 'recipes' ].each do |recipe|
    record = Recipe.new
    record.user = admin
    record.name = recipe[ 'name' ]
    record.energy_cost = recipe[ 'energy' ]
    record.modded = false
    record.save

    recipe[ 'inputs' ].each do |name, value|
      record.ingredients.create name: name, amount: value, input: true, recipe: record
    end

    recipe[ 'outputs' ].each do |name, value|
      record.ingredients.create name: name, amount: value, input: false, recipe: record
    end
  end
end

