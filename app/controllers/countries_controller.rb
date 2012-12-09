# coding: utf-8
class CountriesController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /countries
  # GET /countries.json
  def index
    @title = "Страны"
    @countries = Country.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @title = "Страна"
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country }
    end
  end

  # GET /countries/new
  # GET /countries/new.json
  def new
    @title = "Добавление страны"
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.json
  def create
    @title = "Редактирование страны"
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        flash[:success] = "Страна успешно добавлена."
        format.html { redirect_to @country }
        format.json { render json: @country, status: :created, location: @country }
      else
        flash.now[:error] = "Страна с таким названием не может быть добавлена!"
        format.html { render action: "new" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.json
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
        flash[:success] = "Страна успешно отредактирована."
        format.html { redirect_to @country }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    respond_to do |format|
      flash[:success] = "Страна успешно удалена."
      format.html { redirect_to countries_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
