# coding: utf-8
class StreetsController < ApplicationController
    
  before_filter :admin_authenticate
  
  # GET /streets
  # GET /streets.json
  def index
    @title = "Улицы"
    @streets = Street.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @streets }
    end
  end

  # GET /streets/1
  # GET /streets/1.json
  def show
    @title = "Улица"
    @street = Street.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @street }
    end
  end

  # GET /streets/new
  # GET /streets/new.json
  def new
    @title = "Добавление улицы"
    @street = Street.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @street }
    end
  end

  # GET /streets/1/edit
  def edit
    @street = Street.find(params[:id])
  end

  # POST /streets
  # POST /streets.json
  def create
    @title = "Редактирование улицы"
    @street = Street.new(params[:street])

    respond_to do |format|
      if @street.save
        flash[:success] = "Улица успешно добавлена."
        format.html { redirect_to @street }
        format.json { render json: @street, status: :created, location: @street }
      else
        flash.now[:error] = "Улица с таким названием не может быть добавлена!"
        format.html { render action: "new" }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /streets/1
  # PUT /streets/1.json
  def update
    @street = Street.find(params[:id])

    respond_to do |format|
      if @street.update_attributes(params[:street])
        flash[:success] = "Улица успешно отредактирована."
        format.html { redirect_to @street }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streets/1
  # DELETE /streets/1.json
  def destroy
    @street = Street.find(params[:id])
    @street.destroy

    respond_to do |format|
      flash[:success] = "Улица успешно удалена."
      format.html { redirect_to streets_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
