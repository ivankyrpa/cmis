# coding: utf-8
class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json
  def index
    @title = "Разделы"
    @sections = Section.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @title = "Раздел"
    @section = Section.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.json
  def new 
    @title = "Добавление раздела"
    @section = Section.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @title = "Редактирование раздела"
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        flash[:success] = "Раздел успешно добавлен"
        format.html { redirect_to @section }
        format.json { render json: @section, status: :created, location: @section }
      else
        flash.now[:error] = "Введены некорректные данные"
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        flash[:success] = "Раздел успешно отредактирован"
        format.html { redirect_to @section }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены некорректные данные"
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      flash[:success] = "Раздел успешно удален"
      format.html { redirect_to sections_url }
      format.json { head :no_content }
    end
  end
end
