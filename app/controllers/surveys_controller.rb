# coding: utf-8
class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.json
  def index
    @title = "Обследования"
    @groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    ids_characteristics = []
    @groups.each do |group|
      group.characteristics.each do |charact|
        ids_characteristics.push(charact.id)
      end
    end
    @surveys = []
    @surveys_init = Survey.all
    @surveys_init.each do |survey|
      arr = []
      if (survey.characteristics_surveys.length != 0)
        arr.push(survey.characteristics_surveys.first.characteristic_id)
        if (ids_characteristics & arr).empty? 
          @surveys
        else
          @surveys.push(survey)
        end
      else
        @surveys.push(survey)
      end
    end
    @pacients = Pacient.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @title = "Обследование"
    @survey = Survey.find(params[:id])
    characteristics_sur = @survey.characteristics_surveys
    ch_sur_ids = characteristics_sur.map(&:characteristic_id)
    groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    # Отображение информации об обследованиях
    @result_array = []
    groups.each do |group|
      ch_gr_ids = group.characteristic_ids
      match = ch_gr_ids & ch_sur_ids
      unless  match.empty?
        @oper = 0
        @cons = 0
        @resur = ch_gr_ids.length
        characts_sur = []
        ch_sur_for_gr_ids = ch_sur_ids - (ch_sur_ids - match)
        characteristics_sur.each do |ch|
          unless (ch_sur_for_gr_ids & [ch.characteristic_id]).empty?
            characts_sur << ch
            case ch.result
              when 1
                @oper = @oper + 1
              when 2
                @cons = @cons + 1
              else
            end
          end
        end
        @resur = @resur - @oper - @cons
        @result_array << [group, characts_sur]
        ch_sur_ids = ch_sur_ids - match
      end
    end

    gon.oper = @oper
    gon.cons = @cons
    gon.resur = @resur

    # Количество характеристик для обследования
    @characteristics_for_sur = []
    groups.each do |group|
      @characteristics_for_sur += group.characteristics
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @title = "Добавление обследования"
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        flash[:success] = "Обследование успешно добавлено."
        format.html { redirect_to @survey }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])
    @characteristics_sur = @survey.characteristics_surveys
    @survey.characteristics_surveys.build(params[:survey][:characteristics_survey])
    
    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        flash[:success] = "Обследование успешно отредактировано."
        format.html { redirect_to @survey }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      flash[:success] = "Обследование успешно удалено."
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end

end
