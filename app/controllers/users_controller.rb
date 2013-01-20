# coding: utf-8
class UsersController < ApplicationController

  before_filter :authenticate, :only => [:show]
  before_filter :admin_authenticate, :only => [:new, :create, :edit, :update, :destroy, :index]

  def new
    @user = User.new
    @title = "Новый пользователь"
  end
  
  def index
    @title = "Пользователи"
    @users = User.all
  end
  
  def destroy
    user = User.find(params[:id])
    if not_editable(user)
      redirect_to user_path(params[:id])
    else
      user.destroy
      flash[:success] = "Пользователь удален."
      redirect_to users_path
    end
  end
  
  def show
    @user = User.find(params[:id])
    @title = "Пользователь #{@user.fio}"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Пользователь успешно добавлен"
      redirect_to users_path
    else
      flash.now[:error] = "Введены неверные данные."
      @title = "Новый пользователь"
      render 'new'
    end  
  end
  
  def edit
    @user = User.find(params[:id])
    if not_editable(@user)
      redirect_to user_path(params[:id])
    else
      @title = "Редактирование пользователя"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Информация о пользователе изменена."
      redirect_to users_path
    else
      flash.now[:error] = "Введены неверные данные."
      @title = "Редактирование пользователя"
      render 'edit'
    end
  end
  
  private 
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def admin_authenticate
      deny_access unless admin?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
