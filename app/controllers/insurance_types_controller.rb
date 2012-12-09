# coding: utf-8
class InsuranceTypesController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /insurance_types
  # GET /insurance_types.json
  def index
    @title = "Типы страхования"
    @insurance_types = InsuranceType.all

    respond_to do |format|
      if InsuranceType.all.length < 2
        format.html # index.html.erb
        format.json { render json: @insurance_types }
      else
        flash.now[:block] = "Ограничение на количество типов!"
        format.html { render action: "index" }
        format.json { render json: @user_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /insurance_types/1
  # GET /insurance_types/1.json
  def show
    @title = "Тип страхования"
    @insurance_type = InsuranceType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insurance_type }
    end
  end

  # GET /insurance_types/new
  # GET /insurance_types/new.json
  def new
    @title = "Добавление типа страхования"
    @insurance_type = InsuranceType.new

    respond_to do |format|
      if InsuranceType.all.length < 2
        format.html # new.html.erb
        format.json { render json: @insurance_type }
      end
    end
  end

  # GET /insurance_types/1/edit
  def edit
    @title = "Редактирование типа страхования"
    @insurance_type = InsuranceType.find(params[:id])
  end

  # POST /insurance_types
  # POST /insurance_types.json
  def create
    @insurance_type = InsuranceType.new(params[:insurance_type])

    respond_to do |format|
      if @insurance_type.save
        flash[:success] = "Тип успешно добавлен."
        format.html { redirect_to @insurance_type }
        format.json { render json: @insurance_type, status: :created, location: @insurance_type }
      else
        flash.now[:error] = "Тип с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @insurance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_types/1
  # PUT /insurance_types/1.json
  def update
    @insurance_type = InsuranceType.find(params[:id])

    respond_to do |format|
      if @insurance_type.update_attributes(params[:insurance_type])
        flash[:success] = "Тип успешно отредактирован."
        format.html { redirect_to @insurance_type }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @insurance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_types/1
  # DELETE /insurance_types/1.json
  def destroy
    @insurance_type = InsuranceType.find(params[:id])
    @insurance_type.destroy

    respond_to do |format|
      flash[:success] = "Тип успешно удален."
      format.html { redirect_to insurance_types_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
