# coding: utf-8
class DiagnosesController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /diagnoses
  # GET /diagnoses.json
  def index
    @title = "Диагнозы"
    @diagnoses = Diagnosis.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diagnoses }
    end
  end

  # GET /diagnoses/1
  # GET /diagnoses/1.json
  def show
    @title = "Диагноз"
    @diagnosis = Diagnosis.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diagnosis }
    end
  end

  # GET /diagnoses/new
  # GET /diagnoses/new.json
  def new
    @title = "Добавление диагноза"
    @diagnosis = Diagnosis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diagnosis }
    end
  end

  # GET /diagnoses/1/edit
  def edit
    @title = "Редактирование диагноза"
    @diagnosis = Diagnosis.find(params[:id])
  end

  # POST /diagnoses
  # POST /diagnoses.json
  def create
    @diagnosis = Diagnosis.new(params[:diagnosis])

    respond_to do |format|
      if @diagnosis.save
        flash[:success] = "Диагноз успешно добавлен."
        format.html { redirect_to @diagnosis }
        format.json { render json: @diagnosis, status: :created, location: @diagnosis }
      else
        flash.now[:error] = "Диагноз с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diagnoses/1
  # PUT /diagnoses/1.json
  def update
    @diagnosis = Diagnosis.find(params[:id])

    respond_to do |format|
      if @diagnosis.update_attributes(params[:diagnosis])
        flash[:success] = "Диагноз успешно отредактирован."
        format.html { redirect_to @diagnosis }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnoses/1
  # DELETE /diagnoses/1.json
  def destroy
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.destroy

    respond_to do |format|
      flash[:success] = "Диагноз успешно удален."
      format.html { redirect_to diagnoses_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
