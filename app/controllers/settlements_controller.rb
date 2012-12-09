# coding: utf-8
class SettlementsController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /settlements
  # GET /settlements.json
  def index
    @title = "Населенные пункты"
    @settlements = Settlement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @settlements }
    end
  end

  # GET /settlements/1
  # GET /settlements/1.json
  def show
    @title = "Населенный пункт"
    @settlement = Settlement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @settlement }
    end
  end

  # GET /settlements/new
  # GET /settlements/new.json
  def new
    @title = "Добавление населенного пункта"
    @settlement = Settlement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @settlement }
    end
  end

  # GET /settlements/1/edit
  def edit
    @settlement = Settlement.find(params[:id])
  end

  # POST /settlements
  # POST /settlements.json
  def create
    @title = "Редактирование населенного пункта"
    @settlement = Settlement.new(params[:settlement])

    respond_to do |format|
      if @settlement.save
        flash[:success] = "Населенный пункт успешно добавлен."
        format.html { redirect_to @settlement }
        format.json { render json: @settlement, status: :created, location: @settlement }
      else
        flash.now[:error] = "Населенный пункт с таким названием не может быть добавлен!"
        format.html { render action: "new" }
        format.json { render json: @settlement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /settlements/1
  # PUT /settlements/1.json
  def update
    @settlement = Settlement.find(params[:id])

    respond_to do |format|
      if @settlement.update_attributes(params[:settlement])
        flash[:success] = "Населенный пункт успешно отредактирован."
        format.html { redirect_to @settlement }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @settlement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settlements/1
  # DELETE /settlements/1.json
  def destroy
    @settlement = Settlement.find(params[:id])
    @settlement.destroy

    respond_to do |format|
      flash[:success] = "Населенный пункт успешно удален."
      format.html { redirect_to settlements_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
