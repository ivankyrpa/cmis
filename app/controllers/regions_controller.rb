# coding: utf-8
class RegionsController < ApplicationController
    
  before_filter :admin_authenticate
  
  # GET /regions
  # GET /regions.json
  def index
    @title = "Области"
    @regions = Region.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions }
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @title = "Область"
    @region = Region.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @region }
    end
  end

  # GET /regions/new
  # GET /regions/new.json
  def new
    @title = "Добавление области"
    @region = Region.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @region }
    end
  end

  # GET /regions/1/edit
  def edit
    @region = Region.find(params[:id])
  end

  # POST /regions
  # POST /regions.json
  def create
    @title = "Редактирование области"
    @region = Region.new(params[:region])

    respond_to do |format|
      if @region.save
        flash[:success] = "Область успешно добавлена."
        format.html { redirect_to @region }
        format.json { render json: @region, status: :created, location: @region }
      else
        flash.now[:error] = "Область с таким названием не может быть добавлена!"
        format.html { render action: "new" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /regions/1
  # PUT /regions/1.json
  def update
    @region = Region.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(params[:region])
        flash[:success] = "Область успешно отредактирована."
        format.html { redirect_to @region }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region = Region.find(params[:id])
    @region.destroy

    respond_to do |format|
      flash[:success] = "Область успешно удалена."
      format.html { redirect_to regions_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
