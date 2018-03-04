class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find params[ :id ]
  end

  def account
    @user = current_user
  end

  def create
    @user = User.new allowed_params
    if @user.save
      login @user
      flash[ :success ] = 'Welcome'
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
