# coding: utf-8
class TreatmentTypesController < ApplicationController
    
  before_filter :admin_authenticate
  
  # GET /treatment_types
  # GET /treatment_types.json
  def index
    @title = "Типы лечения"
    @treatment_types = TreatmentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @treatment_types }
    end
  end

  # GET /treatment_types/1
  # GET /treatment_types/1.json
  def show
    @title = "Тип лечения"
    @treatment_type = TreatmentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treatment_type }
    end
  end

  # GET /treatment_types/new
  # GET /treatment_types/new.json
  def new
    @title = "Добавление типа лечения"
    @treatment_type = TreatmentType.new

    respond_to do |format|
      if TreatmentType.all.length < 3
        format.html # new.html.erb
        format.json { render json: @treatment_type }
      end
    end
  end

  # GET /treatment_types/1/edit
  def edit
    @title = "Редактирование типа лечения"
    @treatment_type = TreatmentType.find(params[:id])
  end

  # POST /treatment_types
  # POST /treatment_types.json
  def create
    @treatment_type = TreatmentType.new(params[:treatment_type])

    respond_to do |format|
      if @treatment_type.save
        flash[:success] = "Тип успешно добавлен."
        format.html { redirect_to @treatment_type }
        format.json { render json: @treatment_type, status: :created, location: @treatment_type }
      else
        flash.now[:error] = "Тип с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @treatment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /treatment_types/1
  # PUT /treatment_types/1.json
  def update
    @treatment_type = TreatmentType.find(params[:id])

    respond_to do |format|
      if @treatment_type.update_attributes(params[:treatment_type])
        flash[:success] = "Тип успешно отредактирован."
        format.html { redirect_to @treatment_type }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @treatment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_types/1
  # DELETE /treatment_types/1.json
  def destroy
    @treatment_type = TreatmentType.find(params[:id])
    @treatment_type.destroy

    respond_to do |format|
      flash[:success] = "Тип успешно удален."
      format.html { redirect_to treatment_types_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
