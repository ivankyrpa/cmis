# coding: utf-8
class DistrictsController < ApplicationController
    
  before_filter :admin_authenticate
  
  # GET /districts
  # GET /districts.json
  def index
    @title = "Районы"
    @districts = District.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @districts }
    end
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
    @title = "Район"
    @district = District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @district }
    end
  end

  # GET /districts/new
  # GET /districts/new.json
  def new
    @title = "Добавление района"
    @district = District.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @district }
    end
  end

  # GET /districts/1/edit
  def edit
    @district = District.find(params[:id])
  end

  # POST /districts
  # POST /districts.json
  def create
    @title = "Редактирование района"
    @district = District.new(params[:district])

    respond_to do |format|
      if @district.save
        flash[:success] = "Район успешно добавлен."
        format.html { redirect_to @district }
        format.json { render json: @district, status: :created, location: @district }
      else
        flash.now[:error] = "Район с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /districts/1
  # PUT /districts/1.json
  def update
    @district = District.find(params[:id])

    respond_to do |format|
      if @district.update_attributes(params[:district])
        flash[:success] = "Район успешно отредактирован."
        format.html { redirect_to @district }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    @district = District.find(params[:id])
    @district.destroy

    respond_to do |format|
      flash[:success] = "Район успешно удален."
      format.html { redirect_to districts_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
