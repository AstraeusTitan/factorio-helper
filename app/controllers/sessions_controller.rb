class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[ :session ][ :email ].downcase)
    if user && user.authenticate(params[ :session ][ :password ])
      login user
      redirect_to account_path
    else
      flash.now[ :danger ] = 'Invalid email/password'
      render 'new'
    end
  end

  def delete
    logout
    redirect_to root_url
  end
end
