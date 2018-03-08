# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'json'

Recipe.destroy_all

file = File.read(Rails.root.join('db', 'seeds', 'recipe_seed_data.json'))
data = JSON.parse file

puts data[ 'recipes' ].count
data[ 'recipes' ].each do |recipe|
  record = Recipe.new
  record.user_id = 1  #easy to tell what data is seeded
  record.name = recipe[ 'name' ]
  record.energy_cost = recipe[ 'energy' ]
  record.modded = false

  recipe[ 'inputs' ].each do |name, value|
    record.ingredients.build name: name, amount: value, input: true
  end

  recipe[ 'outputs' ].each do |name, value|
    record.ingredients.build name: name, amount: value, input: false
  end
  puts record
  puts record.valid?
  puts record.errors.full_messages
  record.save
end

