# coding: utf-8
class GroupsController < ApplicationController
      
  before_filter :admin_authenticate
  
  # GET /groups
  # GET /groups.json
  def index
    @title = "Группы характеристик"
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @title = "Группа характеристик"
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @title = "Добавление группы характеристик"
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @title = "Редактирование группы характеристик"
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        flash[:success] = "Группа успешно добавлена."
        format.html { redirect_to @group }
        format.json { render json: @group, status: :created, location: @group }
      else
        flash.now[:error] = "Группа с таким названием не может быть добавлена!"
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:success] = "Группа успешно отредактирована."
        format.html { redirect_to @group }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены некорректные данные!"
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      flash[:success] = "Группа успешно удалена."
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
