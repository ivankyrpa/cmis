# coding: utf-8
class AnalysisTypesController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /analysis_types
  # GET /analysis_types.json
  def index
    @title = "Типы анализов"
    @analysis_types = AnalysisType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analysis_types }
    end
  end

  # GET /analysis_types/1
  # GET /analysis_types/1.json
  def show
    @title = "Тип анализов"
    @analysis_type = AnalysisType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @analysis_type }
    end
  end

  # GET /analysis_types/new
  # GET /analysis_types/new.json
  def new
    @title = "Добавление типа анализов"
    @analysis_type = AnalysisType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analysis_type }
    end
  end

  # GET /analysis_types/1/edit
  def edit
    @title = "Редактирование типа анализов"
    @analysis_type = AnalysisType.find(params[:id])
  end

  # POST /analysis_types
  # POST /analysis_types.json
  def create
    @analysis_type = AnalysisType.new(params[:analysis_type])

    respond_to do |format|
      if @analysis_type.save
        flash[:success] = "Тип успешно добавлен."
        format.html { redirect_to @analysis_type }
        format.json { render json: @analysis_type, status: :created, location: @analysis_type }
      else
        flash.now[:error] = "Тип с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @analysis_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analysis_types/1
  # PUT /analysis_types/1.json
  def update
    @analysis_type = AnalysisType.find(params[:id])

    respond_to do |format|
      if @analysis_type.update_attributes(params[:analysis_type])
        flash[:success] = "Тип успешно отредактирован."
        format.html { redirect_to @analysis_type }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @analysis_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_types/1
  # DELETE /analysis_types/1.json
  def destroy
    @analysis_type = AnalysisType.find(params[:id])
    @analysis_type.destroy

    respond_to do |format|
      flash[:success] = "Тип успешно удален."
      format.html { redirect_to analysis_types_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
    
end
