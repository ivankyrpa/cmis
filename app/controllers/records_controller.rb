# coding: utf-8
class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  def index
    @title = "Медицинская карта"
    @pacient = Pacient.find(params[:pacient_id])
    @records = @pacient.records

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @title = "Запись"
    @pacient = Pacient.find(params[:pacient_id])
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @title = "Добавление записи"
    @pacient = Pacient.find(params[:pacient_id])
    @record = @pacient.records.build(:doctor_name => current_user.fio, :date_accessed => Date.today)
    @show_diagnosis_fields = true

    5.times { @record.assignments.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @title = "Редактирование записи"
    @pacient = Pacient.find(params[:pacient_id])
    @record = @pacient.records.find(params[:id])
    (current_user.user_type_id == Diagnosis.find(@record.diagnosis_id).user_type_id) ? @show_diagnosis_fields = true : @show_diagnosis_fields = false
  end

  # POST /records
  # POST /records.json
  def create
    @pacient = Pacient.find(params[:pacient_id])
    @record = @pacient.records.build(params[:record])
    @record.doctor_name = current_user.fio;

    respond_to do |format|
      if @record.save
        format.html { redirect_to(pacient_record_path(@pacient, @record)) }
        format.json { render json: @record, status: :created, location: @record }
      else
        format.html { render action: "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @pacient = Pacient.find(params[:pacient_id])
    @record = @pacient.records.find(params[:id])
    @record.doctor_name = current_user.fio;

    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to(pacient_record_path(@pacient, @record)) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @pacient = Pacient.find(params[:pacient_id])
    @record = @pacient.records.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to pacient_records_url }
      format.json { head :no_content }
    end
  end
end
