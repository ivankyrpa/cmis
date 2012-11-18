class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "New user"
  end
  
  def show
    @user = User.find(params[:id])
    @title = "User #{@user.fio}"
  end
  
  def create
    ddd = User.dioid
    #@user = UserType.find(params[:user_type]).users.build(params[:user])
    @user = User.new(params[:user])
    @info = params.to_s
    @user.type_user_id = params[:type_user_id]
    if @user.save
      flash[:success] = "User created successfull."
      redirect_to @user
    else
      @title = "New user"
      render 'new'
    end 
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "User profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  private 
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
