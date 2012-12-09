# coding: utf-8
class SessionsController < ApplicationController
  def new
    if current_user.nil?
      @title = "Вход"
    else
      redirect_to current_user
    end
  end

  def create
    user = User.authenticate(params[:session][:login],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Неверная пара: логин - пароль!"
      @title = "Вход"
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
