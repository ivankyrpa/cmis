# coding: utf-8
class CharacteristicsController < ApplicationController
  # GET /characteristics
  # GET /characteristics.json
  def index
    @title = "Характеристики"
    @user_type = UserType.find(current_user.user_type_id)

    @user_type.name == "лимфолог" ?  @first_val = "От" : @first_val = "Норма"
    @user_type.name == "лимфолог" ?  @second_val = "До" : @second_val = "Отклонение"

    @groups = @user_type.groups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characteristics }
    end
  end

  # GET /characteristics/1
  # GET /characteristics/1.json
  def show
    @title = "Характеристика"
    @user_type = UserType.find(current_user.user_type_id)

    @user_type.name == "лимфолог" ?  @first_val = "От" : @first_val = "Норма"
    @user_type.name == "лимфолог" ?  @second_val = "До" : @second_val = "Отклонение"

    @characteristic = Characteristic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @characteristic }
    end
  end

  # GET /characteristics/new
  # GET /characteristics/new.json
  def new
    @title = "Добавление характеристики"
    @user_type = UserType.find(current_user.user_type_id)

    @user_type.name == "лимфолог" ?  @first_val = "От" : @first_val = "Норма"
    @user_type.name == "лимфолог" ?  @second_val = "До" : @second_val = "Отклонение"

    @characteristic = Characteristic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @characteristic }
    end
  end

  # GET /characteristics/1/edit
  def edit
    @title = "Редактирование характеристики"
    @user_type = UserType.find(current_user.user_type_id)

    @user_type.name == "лимфолог" ?  @first_val = "От" : @first_val = "Норма"
    @user_type.name == "лимфолог" ?  @second_val = "До" : @second_val = "Отклонение"

    @characteristic = Characteristic.find(params[:id])
  end

  # POST /characteristics
  # POST /characteristics.json
  def create
    @characteristic = Characteristic.new(params[:characteristic])

    respond_to do |format|
      if @characteristic.save
        format.html { redirect_to @characteristic }
        format.json { render json: @characteristic, status: :created, location: @characteristic }
      else
        format.html { render action: "new" }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characteristics/1
  # PUT /characteristics/1.json
  def update
    @characteristic = Characteristic.find(params[:id])

    respond_to do |format|
      if @characteristic.update_attributes(params[:characteristic])
        format.html { redirect_to @characteristic }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristics/1
  # DELETE /characteristics/1.json
  def destroy
    @characteristic = Characteristic.find(params[:id])
    @characteristic.destroy

    respond_to do |format|
      format.html { redirect_to characteristics_url }
      format.json { head :no_content }
    end
  end
end
