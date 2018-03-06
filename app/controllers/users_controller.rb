class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def create
    @user = User.new allowed_params
    if @user.save
      login @user
      redirect_to account_path
    else
      render 'new'
    end
  end

  private

    def allowed_params
      params.require(:user).permit :email, :password, :password_confirmation
    end
end
