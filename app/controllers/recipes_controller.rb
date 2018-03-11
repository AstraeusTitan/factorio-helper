class RecipesController < ApplicationController
  def index
    user = current_user
    @recipes = Recipe.browseable_for user
  end

  def show
    @recipe = Recipe.find params[ :id ]
  end
end
