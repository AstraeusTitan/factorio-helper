require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @ingredient = Ingredient.new name:'valid name', amount: 2, input: false,
      recipe: recipes(:magazine)
  end

  test 'ingredient should be valid' do
    assert @ingredient.valid?
  end

  test 'name should be present' do
    @ingredient.name = '  '
    assert_not @ingredient.valid?
  end

  test 'amount should be a number' do
    @ingredient.amount = 'not a number'
    assert_not @ingredient.valid?
  end

  test 'amount should be greater than 0' do
    @ingredient.amount = -1
    assert_not @ingredient.valid?
  end

  test 'should tell if an input' do
    assert_not @ingredient.input?
    @ingredient.input = true
    assert @ingredient.input?
  end
end
