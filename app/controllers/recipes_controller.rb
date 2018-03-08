class RecipesController < ApplicationController
  def index
    unless logged_in?
      @recipes = Recipe.base
    else
      @recipes = Recipe.modded.user current_user
    end
  end

  def show
    @recipe = Recipe.find params[ :id ]
  end
end
