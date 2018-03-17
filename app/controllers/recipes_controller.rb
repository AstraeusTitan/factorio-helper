class RecipesController < ApplicationController
  include RecipesHelper

  def index
    user = current_user
    @recipes = Recipe.browseable_for user
  end

  def show
    @recipe = Recipe.find params[ :id ]
  end

  def upload
    if request.get?
      unless logged_in?
        redirect_to login_path
      end
    end
    if request.post?
      submitted_file = params[ :recipe_list ]
      begin
        process_file submitted_file, current_user
        render :status => 200
      rescue Exception => e
        flash.now[ :error_message ] = e.message
        render :status => 400
      end
    end
  end


end
