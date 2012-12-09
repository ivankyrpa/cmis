# coding: utf-8
class BloodGroupsController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /blood_groups
  # GET /blood_groups.json
  def index
    @title = "Группы крови"
    @blood_groups = BloodGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blood_groups }
    end
  end

  # GET /blood_groups/1
  # GET /blood_groups/1.json
  def show
    @title = "Группа крови"
    @blood_group = BloodGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blood_group }
    end
  end

  # GET /blood_groups/new
  # GET /blood_groups/new.json
  def new
    @title = "Добавление группы крови"
    @blood_group = BloodGroup.new

    respond_to do |format|
      if BloodGroup.all.length < 4
        format.html # new.html.erb
        format.json { render json: @blood_group }
       else
        flash.now[:block] = "Ограничение на количество групп!"
        format.html { render action: "index" }
        format.json { render json: @user_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /blood_groups/1/edit
  def edit
    @title = "Редактирование группы крови"
    @blood_group = BloodGroup.find(params[:id])
  end

  # POST /blood_groups
  # POST /blood_groups.json
  def create
    @blood_group = BloodGroup.new(params[:blood_group])
    
    respond_to do |format|
      
      if @blood_group.save
        flash[:success] = "Группа крови успешно добавлена."
        format.html { redirect_to @blood_group }
        format.json { render json: @blood_group, status: :created, location: @blood_group }
      else
        flash.now[:error] = "Группа крови с таким названием не может быть добавлена!"
        format.html { render action: "new" }
        format.json { render json: @blood_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blood_groups/1
  # PUT /blood_groups/1.json
  def update
    @blood_group = BloodGroup.find(params[:id])

    respond_to do |format|
      if @blood_group.update_attributes(params[:blood_group])
        flash[:success] = "Группа крови успешно отредактирована."
        format.html { redirect_to @blood_group }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @blood_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blood_groups/1
  # DELETE /blood_groups/1.json
  def destroy
    @blood_group = BloodGroup.find(params[:id])
    @blood_group.destroy

    respond_to do |format|
      flash[:success] = "Группа крови успешно удалена."
      format.html { redirect_to blood_groups_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
