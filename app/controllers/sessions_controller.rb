class SessionsController < ApplicationController
  def new
    if current_user.nil?
      @title = "Log in"
    else
      redirect_to current_user
    end
  end

  def create
    user = User.authenticate(params[:session][:login],
                             params[:session][:password])
    if user.nil?
      #flash.now[:error] = "Invalid login/password combination."
      @title = "Log in"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
