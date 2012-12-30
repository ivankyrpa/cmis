class CharacteristicsSurveysController < ApplicationController
  # GET /characteristics_surveys
  # GET /characteristics_surveys.json
  def index
    @characteristics_surveys = CharacteristicsSurvey.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characteristics_surveys }
    end
  end

  # GET /characteristics_surveys/1
  # GET /characteristics_surveys/1.json
  def show
    @characteristics_survey = CharacteristicsSurvey.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @characteristics_survey }
    end
  end

  # GET /characteristics_surveys/new
  # GET /characteristics_surveys/new.json
  def new
    @survey = Survey.find(params[:survey_id])
    groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    @characteristics = []
    groups.each do |group|
      @characteristics += group.characteristics
    end
    ch_ids = @characteristics.map(&:id)
    ch_sur_ids = @survey.characteristics_surveys.map(&:characteristic_id)

    all_characteristics = Characteristic.all

    ch_sur_ids.each do |ch_sur|
      unless (ch_ids & [ch_sur]).empty?
        @res = Characteristic.find(ch_sur)
        @characteristics = @characteristics - [@res]
      end
    end
    @characteristics_survey = CharacteristicsSurvey.new
    
    respond_to do |format|
      format.html { render :layout => false } # new.html.erb
      format.json { render json: @characteristics_survey }
    end
  end

  # GET /characteristics_surveys/1/edit
  def edit
    @survey = Survey.find(params[:survey_id])
    groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    @characteristics = []
    groups.each do |group|
      @characteristics += group.characteristics
    end
    ch_ids = @characteristics.map(&:id)
    ch_sur_ids = @survey.characteristics_surveys.map(&:characteristic_id)

    all_characteristics = Characteristic.all

    ch_sur_ids.each do |ch_sur|
      unless (ch_ids & [ch_sur]).empty?
        res = all_characteristics.find(ch_sur.characteristic_id)
        @characteristics = @characteristics - res
      end
    end

    @characteristics_survey = CharacteristicsSurvey.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout => false } # edit.html.erb
    end
  end

  # POST /characteristics_surveys
  # POST /characteristics_surveys.json
  def create
    @survey = Survey.find(params[:survey_id])
    @charact = Characteristic.find(params[:characteristics_survey][:characteristic_id])
    @value = params[:characteristics_survey][:value].to_f
    if lymph?
      value1 = @charact.first_value
      value2 = @charact.second_value
    else
      value1 = @charact.first_value - @charact.second_value
      value2 = @charact.first_value + @charact.second_value
    end
    if (@value < value1) || (@value > value2)
     @result = 1
    else
     @result = 2
    end
    @characteristics_survey = @survey.characteristics_surveys.build(params[:characteristics_survey])
    @characteristics_survey.result = @result
    
    respond_to do |format|
      if @characteristics_survey.save
        format.html { redirect_to @survey }
        format.json { render json: @characteristics_survey, status: :created, location: @characteristics_survey }
      else
        format.html { render action: "new" }
        format.json { render json: @characteristics_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characteristics_surveys/1
  # PUT /characteristics_surveys/1.json
  def update
    @characteristics_survey = CharacteristicsSurvey.find(params[:id])

    respond_to do |format|
      if @characteristics_survey.update_attributes(params[:characteristics_survey])
        format.html { redirect_to @characteristics_survey, notice: 'Characteristics survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @characteristics_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristics_surveys/1
  # DELETE /characteristics_surveys/1.json
  def destroy
    @survey = Survey.find(params[:survey_id])
    @characteristic_survey = @survey.characteristics_surveys.find(params[:id])
    @characteristic_survey.destroy

    respond_to do |format|
      format.html { redirect_to survey_path(@survey) }
      format.json { head :no_content }
    end
  end
end
