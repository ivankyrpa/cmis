# coding: utf-8
class HistoriesController < ApplicationController
  # GET /histories
  # GET /histories.json
  def index
    @title = "Архив историй"
    @pacient = Pacient.find(params[:pacient_id])
    @histories = @pacient.histories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @histories }
    end
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
    @title = "История болезни"
    @pacient = Pacient.find(params[:pacient_id])
    @history = History.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @history }
    end
  end

  # GET /histories/new
  # GET /histories/new.json
  def new
    @title = "Добавление истории болезни"
    @pacient = Pacient.find(params[:pacient_id])
    @history = @pacient.histories.build(:user_id => current_user.id, :date_supply => Date.today)
    @show_diagnosis_fields = true

    5.times { @history.assignments.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @history }
    end
  end

  # GET /histories/1/edit
  def edit
    @title = "Редактирование истории болезни"
    @pacient = Pacient.find(params[:pacient_id])
    @history = @pacient.histories.find(params[:id])
    (current_user.user_type_id == Diagnosis.find(@history.diagnosis_id).user_type_id) ? @show_diagnosis_fields = true : @show_diagnosis_fields = false
  end

  # POST /histories
  # POST /histories.json
  def create
    @pacient = Pacient.find(params[:pacient_id])
    @history = @pacient.histories.build(params[:history])
    @history.user_id = current_user.id;

    respond_to do |format|
      if @history.save
        format.html { redirect_to(pacient_history_path(@pacient, @history)) }
        format.json { render json: @history, status: :created, location: @history }
      else
        format.html { render action: "new" }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /histories/1
  # PUT /histories/1.json
  def update
    @pacient = Pacient.find(params[:pacient_id])
    @history = @pacient.histories.find(params[:id])

    respond_to do |format|
      if @history.update_attributes(params[:history])
        format.html { redirect_to(pacient_history_path(@pacient, @history)) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @pacient = Pacient.find(params[:pacient_id])
    @history = @pacient.histories.find(params[:id])
    @history.destroy

    respond_to do |format|
      format.html { redirect_to pacient_histories_url }
      format.json { head :no_content }
    end
  end
end
