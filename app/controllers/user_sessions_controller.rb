class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def create
    @user = login(params[:username], params[:password])

    if @user
      redirect_back_or_to(:root, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_back_or_to(:root, notice: 'Logged out!')
  end
end
