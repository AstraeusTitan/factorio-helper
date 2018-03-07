require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new name:'good-name', energy_cost: 1.0, user: users(:bob)
  end

  test 'recipe should be valid' do
    assert @recipe.valid?
  end

  test 'name should be present' do
    @recipe.name = '  '
    assert_not @recipe.valid?
  end

  test 'energy_cost should be a number' do
    @recipe.energy_cost = 'not a number'
    assert_not @recipe.valid?
  end

  test 'energy_cost should be greater than 0' do
    @recipe.energy_cost = 0
    assert_not @recipe.valid?
  end

  test 'should tell if modded' do
    assert @recipe.modded?
    @recipe.modded = false
    assert_not @recipe.modded?
  end

  test 'should be able to access ingredients' do
    recipe = recipes :assembler
    assert_not recipe.ingredients.empty?
  end

  test 'should return inputs' do
    recipe = recipes :assembler
    assert_equal recipe.inputs.size, 3
  end

  test 'should return outputs' do
    recipe = recipes :assembler
    assert_equal recipe.outputs.size, 1
  end

  test 'should return base recipes' do
    recipes = Recipe.base
    assert_equal recipes.count, 1
  end

  test 'should return modded recipes' do
    recipes = Recipe.modded
    assert_equal recipes.count, 1
  end

  test 'should return recipes by user' do
    recipes = Recipe.user users(:bob)
    assert_equal recipes.count, 2
    recipes = Recipe.user users(:dave)
    assert_equal recipes.count, 0
  end

  test 'scopes should chain' do
    recipes = Recipe.modded.user users(:bob)
    assert_equal recipes.count, 1
  end
end
