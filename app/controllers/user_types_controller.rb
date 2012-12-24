# coding: utf-8
class UserTypesController < ApplicationController

  before_filter :admin_authenticate
  
  def index
    @title = "Специализации"
    @user_types = UserType.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_types }
    end
  end

  def show
    @title = "Специализациия"
    @user_type = UserType.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_type }
    end
  end

  def new
    @title = "Добавление специализации"
    @user_type = UserType.new

    respond_to do |format|
      if UserType.all.length < 3
        format.html # new.html.erb
        format.json { render json: @user_type }
      else
        flash.now[:block] = "Ограничение на количество специализаций!"
        format.html { render action: "index" }
        format.json { render json: @user_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @title = "Редактирование специализации"
    @user_type = UserType.find(params[:id])
  end

  def create
    @user_type = UserType.new(params[:user_type])

    respond_to do |format|
      if params[:user_type][:admin] == '1' && (UserType.find_all_by_admin(true).length == 0)
        flash.now[:error] = "Специализация с правами администратора уже существует!"
        format.html { render action: "new" }
        format.json { render json: @user_type.errors, status: :unprocessable_entity }
      else
        if @user_type.save
          flash[:success] = "Специализация успешно добавлена."
          format.html { redirect_to @user_type }
          format.json { render json: @user_type, status: :created, location: @user_type }
        else
          flash.now[:error] = "Специализация с таким названием не может быть добавлена!"
          format.html { render action: "new" }
          format.json { render json: @user_type.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    @user_type = UserType.find(params[:id])

    respond_to do |format|
      if !@user_type.admin && params[:user_type][:admin] == '1' && (UserType.find_all_by_admin(true).length > 0)
        flash.now[:error] = "Специализация с правами администратора уже существует!"
        format.html { render action: "edit" }
        format.json { render json: @user_type.errors, status: :unprocessable_entity }
      else
        if @user_type.admin && params[:user_type][:admin] == '0'
          flash.now[:warning] = "Нельзя отобрать права администратора у этой специализации..."
          format.html { render action: "edit" }
          format.json { render json: @user_type.errors, status: :unprocessable_entity }
        else
          if @user_type.update_attributes(params[:user_type])
            flash[:success] = "Специализация успешно отредактирована."
            format.html { redirect_to @user_type }
            format.json { head :no_content }
          else
            flash.now[:error] = "Введены неверные данные!"
            format.html { render action: "edit" }
            format.json { render json: @user_type.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  def destroy
    @user_type = UserType.find(params[:id])
    if @user_type.admin
      respond_to do |format|
        flash[:error] = "Специализация с правами администратора не может быть удалена!"
        format.html { redirect_to user_types_url }
        format.json { head :no_content }
      end
    else
      @user_type.destroy
      respond_to do |format|
        flash[:success] = "Специализация успешно удалена."
        format.html { redirect_to user_types_url }
        format.json { head :no_content }
      end
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
