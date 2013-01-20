class LRecommendationsController < ApplicationController
  # GET /l_recommendations
  # GET /l_recommendations.json
  def index
    @l_recommendations = LRecommendation.all
    @groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @l_recommendations }
    end
  end

  # GET /l_recommendations/1
  # GET /l_recommendations/1.json
  def show
    @l_recommendation = LRecommendation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @l_recommendation }
    end
  end

  # GET /l_recommendations/new
  # GET /l_recommendations/new.json
  def new
    @l_recommendation = LRecommendation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @l_recommendation }
    end
  end

  # GET /l_recommendations/1/edit
  def edit
    @l_recommendation = LRecommendation.find(params[:id])
  end

  # POST /l_recommendations
  # POST /l_recommendations.json
  def create
    @l_recommendation = LRecommendation.new(params[:l_recommendation])

    respond_to do |format|
      if @l_recommendation.save
        format.html { redirect_to l_recommendations_url }
        format.json { render json: @l_recommendation, status: :created, location: @l_recommendation }
      else
        format.html { render action: "new" }
        format.json { render json: @l_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /l_recommendations/1
  # PUT /l_recommendations/1.json
  def update
    @l_recommendation = LRecommendation.find(params[:id])

    respond_to do |format|
      if @l_recommendation.update_attributes(params[:l_recommendation])
        format.html { redirect_to l_recommendations_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @l_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_recommendations/1
  # DELETE /l_recommendations/1.json
  def destroy
    @l_recommendation = LRecommendation.find(params[:id])
    @l_recommendation.destroy

    respond_to do |format|
      format.html { redirect_to l_recommendations_url }
      format.json { head :no_content }
    end
  end
end
