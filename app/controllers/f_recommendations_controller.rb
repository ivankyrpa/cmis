class FRecommendationsController < ApplicationController
  # GET /f_recommendations
  # GET /f_recommendations.json
  def index
    @f_recommendations = FRecommendation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @f_recommendations }
    end
  end

  # GET /f_recommendations/1
  # GET /f_recommendations/1.json
  def show
    @f_recommendation = FRecommendation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @f_recommendation }
    end
  end

  # GET /f_recommendations/new
  # GET /f_recommendations/new.json
  def new
    @f_recommendation = FRecommendation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @f_recommendation }
    end
  end

  # GET /f_recommendations/1/edit
  def edit
    @f_recommendation = FRecommendation.find(params[:id])
  end

  # POST /f_recommendations
  # POST /f_recommendations.json
  def create
    @f_recommendation = FRecommendation.new(params[:f_recommendation])

    respond_to do |format|
      if @f_recommendation.save
        format.html { redirect_to @f_recommendation, notice: 'F recommendation was successfully created.' }
        format.json { render json: @f_recommendation, status: :created, location: @f_recommendation }
      else
        format.html { render action: "new" }
        format.json { render json: @f_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /f_recommendations/1
  # PUT /f_recommendations/1.json
  def update
    @f_recommendation = FRecommendation.find(params[:id])

    respond_to do |format|
      if @f_recommendation.update_attributes(params[:f_recommendation])
        format.html { redirect_to @f_recommendation, notice: 'F recommendation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @f_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f_recommendations/1
  # DELETE /f_recommendations/1.json
  def destroy
    @f_recommendation = FRecommendation.find(params[:id])
    @f_recommendation.destroy

    respond_to do |format|
      format.html { redirect_to f_recommendations_url }
      format.json { head :no_content }
    end
  end
end
