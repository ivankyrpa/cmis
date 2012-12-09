# coding: utf-8
class CitiesController < ApplicationController

  before_filter :admin_authenticate
  
  # GET /cities
  # GET /cities.json
  def index
    @title = "Города"
    @cities = City.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities }
    end
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @title = "Город"
    @city = City.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city }
    end
  end

  # GET /cities/new
  # GET /cities/new.json
  def new
    @title = "Добавление города"
    @city = City.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city }
    end
  end

  # GET /cities/1/edit
  def edit
    @title = "Редактирование города"
    @city = City.find(params[:id])
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        flash[:success] = "Город успешно добавлен."
        format.html { redirect_to @city }
        format.json { render json: @city, status: :created, location: @city }
      else
        flash.now[:error] = "Город с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.json
  def update
    @city = City.find(params[:id])

    respond_to do |format|
      if @city.update_attributes(params[:city])
        flash[:success] = "Город успешно отредактирован."
        format.html { redirect_to @city }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      flash[:success] = "Город успешно удален."
      format.html { redirect_to cities_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
