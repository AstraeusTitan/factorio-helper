class StaticPagesController < ApplicationController
  def welcome
    if logged_in?
      redirect_to account_path
    else
      render 'welcome'
    end
  end
end
