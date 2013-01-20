# coding: utf-8
class FCharacteristicsController < ApplicationController
  # GET /f_characteristics
  # GET /f_characteristics.json
  def index
    @title = "Характеристики"
    @user_type = UserType.find(current_user.user_type_id)

    @groups = @user_type.groups
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @f_characteristics }
    end
  end

  # GET /f_characteristics/1
  # GET /f_characteristics/1.json
  def show
    @title = "Характеристика"
    @user_type = UserType.find(current_user.user_type_id)
    
    @f_characteristic = FCharacteristic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @f_characteristic }
    end
  end

  # GET /f_characteristics/new
  # GET /f_characteristics/new.json
  def new
    @title = "Добавление характеристики"
    @user_type = UserType.find(current_user.user_type_id)

    @f_characteristic = FCharacteristic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @f_characteristic }
    end
  end

  # GET /f_characteristics/1/edit
  def edit
    @title = "Редактирование характеристики"
    @user_type = UserType.find(current_user.user_type_id)
    
    @f_characteristic = FCharacteristic.find(params[:id])
  end

  # POST /f_characteristics
  # POST /f_characteristics.json
  def create
    @f_characteristic = FCharacteristic.new(params[:f_characteristic])

    respond_to do |format|
      if @f_characteristic.save
        format.html { redirect_to @f_characteristic }
        format.json { render json: @f_characteristic, status: :created, location: @f_characteristic }
      else
        format.html { render action: "new" }
        format.json { render json: @f_characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /f_characteristics/1
  # PUT /f_characteristics/1.json
  def update
    @f_characteristic = FCharacteristic.find(params[:id])

    respond_to do |format|
      if @f_characteristic.update_attributes(params[:f_characteristic])
        format.html { redirect_to @f_characteristic }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @f_characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f_characteristics/1
  # DELETE /f_characteristics/1.json
  def destroy
    @f_characteristic = FCharacteristic.find(params[:id])
    @f_characteristic.destroy

    respond_to do |format|
      format.html { redirect_to f_characteristics_url }
      format.json { head :no_content }
    end
  end
end
