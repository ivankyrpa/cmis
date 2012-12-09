# coding: utf-8
class SymptomsController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /symptoms
  # GET /symptoms.json
  def index
    @title = "Симптомы"
    @symptoms = Symptom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @symptoms }
    end
  end

  # GET /symptoms/1
  # GET /symptoms/1.json
  def show
    @title = "Симптом"
    @symptom = Symptom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @symptom }
    end
  end

  # GET /symptoms/new
  # GET /symptoms/new.json
  def new
    @title = "Добавление симптома"
    @symptom = Symptom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @symptom }
    end
  end

  # GET /symptoms/1/edit
  def edit
    @title = "Редактирование симптома"
    @symptom = Symptom.find(params[:id])
  end

  # POST /symptoms
  # POST /symptoms.json
  def create
    @symptom = Symptom.new(params[:symptom])

    respond_to do |format|
      if @symptom.save
        flash[:success] = "Симптом успешно добавлен."
        format.html { redirect_to @symptom }
        format.json { render json: @symptom, status: :created, location: @symptom }
      else
        flash.now[:error] = "Симптом с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /symptoms/1
  # PUT /symptoms/1.json
  def update
    @symptom = Symptom.find(params[:id])

    respond_to do |format|
      if @symptom.update_attributes(params[:symptom])
        flash[:success] = "Симптом успешно отредактирован."
        format.html { redirect_to @symptom }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symptoms/1
  # DELETE /symptoms/1.json
  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.destroy

    respond_to do |format|
      flash[:success] = "Симптом успешно удален."
      format.html { redirect_to symptoms_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
