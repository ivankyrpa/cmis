# coding: utf-8
class AgeGroupsController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /age_groups
  # GET /age_groups.json
  def index
    @title = "Возрастные группы"
    @age_groups = AgeGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @age_groups }
    end
  end

  # GET /age_groups/1
  # GET /age_groups/1.json
  def show
    @title = "Возрастная группа"
    @age_group = AgeGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @age_group }
    end
  end

  # GET /age_groups/new
  # GET /age_groups/new.json
  def new
    @title = "Добавление возрастной группы"
    @age_group = AgeGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @age_group }
    end
  end

  # GET /age_groups/1/edit
  def edit
    @title = "Редактирование возрастной группы"
    @age_group = AgeGroup.find(params[:id])
  end

  # POST /age_groups
  # POST /age_groups.json
  def create
    @age_group = AgeGroup.new(params[:age_group])

    respond_to do |format|
      if (@age_group.from < @age_group.to) && @age_group.save
        flash[:success] = "Группа успешно добавлена."
        format.html { redirect_to @age_group }
        format.json { render json: @age_group, status: :created, location: @age_group }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "new" }
        format.json { render json: @age_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /age_groups/1
  # PUT /age_groups/1.json
  def update
    @age_group = AgeGroup.find(params[:id])

    respond_to do |format|
      if (@age_group.from < @age_group.to) && @age_group.update_attributes(params[:age_group])
        flash[:success] = "Группа успешно отредактирована."
        format.html { redirect_to @age_group }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @age_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /age_groups/1
  # DELETE /age_groups/1.json
  def destroy
    @age_group = AgeGroup.find(params[:id])
    @age_group.destroy

    respond_to do |format|
      flash[:success] = "Группа успешно удалена."
      format.html { redirect_to age_groups_url }
      format.json { head :no_content }
    end
  end
    
  private    
    def admin_authenticate
      deny_access unless admin?
    end
end
