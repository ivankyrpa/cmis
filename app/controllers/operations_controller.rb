# coding: utf-8
class OperationsController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /operations
  # GET /operations.json
  def index
    @title = "Операции"
    @operations = Operation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations }
    end
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
    @title = "Операция"
    @operation = Operation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operation }
    end
  end

  # GET /operations/new
  # GET /operations/new.json
  def new
    @title = "Добавление операции"
    @operation = Operation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operation }
    end
  end

  # GET /operations/1/edit
  def edit
    @title = "Редактирование операции"
    @operation = Operation.find(params[:id])
  end

  # POST /operations
  # POST /operations.json
  def create
    @operation = Operation.new(params[:operation])

    respond_to do |format|
      if @operation.save
        flash[:success] = "Операция успешно добавлена."
        format.html { redirect_to @operation }
        format.json { render json: @operation, status: :created, location: @operation }
      else
        flash.now[:error] = "Операция с таким названием не может быть добавлена!"
        format.html { render action: "new" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /operations/1
  # PUT /operations/1.json
  def update
    @operation = Operation.find(params[:id])

    respond_to do |format|
      if @operation.update_attributes(params[:operation])
        flash[:success] = "Операция успешно отредактирована."
        format.html { redirect_to @operation }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy

    respond_to do |format|  
      flash[:success] = "Операция успешно удалена."
      format.html { redirect_to operations_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
 
end
