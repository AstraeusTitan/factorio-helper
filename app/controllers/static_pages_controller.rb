class StaticPagesController < ApplicationController
  def welcome
    if logged_in?
      redirect_to @current_user
    else
      render 'welcome'
    end
  end
end
