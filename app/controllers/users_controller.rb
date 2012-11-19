class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]

  def new
    @user = User.new
    @title = "New user"
  end
  
  def index
    @title = "All users"
    @users = User.all
  end
  
  def destroy
    User.find(params[:id]).destroy
    #flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])
    @title = "User #{@user.fio}"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #flash[:success] = "User created successfull."
      redirect_to users_path
    else
      @title = "New user"
      render 'new'
    end 
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      #flash[:success] = "User profile updated."
      redirect_to users_path
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  private 
    
    def authenticate
      #deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
