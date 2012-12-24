require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FRecommendationsController do

  # This should return the minimal set of attributes required to create a valid
  # FRecommendation. As you add validations to FRecommendation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "group_id" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FRecommendationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all f_recommendations as @f_recommendations" do
      f_recommendation = FRecommendation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:f_recommendations).should eq([f_recommendation])
    end
  end

  describe "GET show" do
    it "assigns the requested f_recommendation as @f_recommendation" do
      f_recommendation = FRecommendation.create! valid_attributes
      get :show, {:id => f_recommendation.to_param}, valid_session
      assigns(:f_recommendation).should eq(f_recommendation)
    end
  end

  describe "GET new" do
    it "assigns a new f_recommendation as @f_recommendation" do
      get :new, {}, valid_session
      assigns(:f_recommendation).should be_a_new(FRecommendation)
    end
  end

  describe "GET edit" do
    it "assigns the requested f_recommendation as @f_recommendation" do
      f_recommendation = FRecommendation.create! valid_attributes
      get :edit, {:id => f_recommendation.to_param}, valid_session
      assigns(:f_recommendation).should eq(f_recommendation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FRecommendation" do
        expect {
          post :create, {:f_recommendation => valid_attributes}, valid_session
        }.to change(FRecommendation, :count).by(1)
      end

      it "assigns a newly created f_recommendation as @f_recommendation" do
        post :create, {:f_recommendation => valid_attributes}, valid_session
        assigns(:f_recommendation).should be_a(FRecommendation)
        assigns(:f_recommendation).should be_persisted
      end

      it "redirects to the created f_recommendation" do
        post :create, {:f_recommendation => valid_attributes}, valid_session
        response.should redirect_to(FRecommendation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved f_recommendation as @f_recommendation" do
        # Trigger the behavior that occurs when invalid params are submitted
        FRecommendation.any_instance.stub(:save).and_return(false)
        post :create, {:f_recommendation => { "group_id" => "invalid value" }}, valid_session
        assigns(:f_recommendation).should be_a_new(FRecommendation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FRecommendation.any_instance.stub(:save).and_return(false)
        post :create, {:f_recommendation => { "group_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested f_recommendation" do
        f_recommendation = FRecommendation.create! valid_attributes
        # Assuming there are no other f_recommendations in the database, this
        # specifies that the FRecommendation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FRecommendation.any_instance.should_receive(:update_attributes).with({ "group_id" => "1" })
        put :update, {:id => f_recommendation.to_param, :f_recommendation => { "group_id" => "1" }}, valid_session
      end

      it "assigns the requested f_recommendation as @f_recommendation" do
        f_recommendation = FRecommendation.create! valid_attributes
        put :update, {:id => f_recommendation.to_param, :f_recommendation => valid_attributes}, valid_session
        assigns(:f_recommendation).should eq(f_recommendation)
      end

      it "redirects to the f_recommendation" do
        f_recommendation = FRecommendation.create! valid_attributes
        put :update, {:id => f_recommendation.to_param, :f_recommendation => valid_attributes}, valid_session
        response.should redirect_to(f_recommendation)
      end
    end

    describe "with invalid params" do
      it "assigns the f_recommendation as @f_recommendation" do
        f_recommendation = FRecommendation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FRecommendation.any_instance.stub(:save).and_return(false)
        put :update, {:id => f_recommendation.to_param, :f_recommendation => { "group_id" => "invalid value" }}, valid_session
        assigns(:f_recommendation).should eq(f_recommendation)
      end

      it "re-renders the 'edit' template" do
        f_recommendation = FRecommendation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FRecommendation.any_instance.stub(:save).and_return(false)
        put :update, {:id => f_recommendation.to_param, :f_recommendation => { "group_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested f_recommendation" do
      f_recommendation = FRecommendation.create! valid_attributes
      expect {
        delete :destroy, {:id => f_recommendation.to_param}, valid_session
      }.to change(FRecommendation, :count).by(-1)
    end

    it "redirects to the f_recommendations list" do
      f_recommendation = FRecommendation.create! valid_attributes
      delete :destroy, {:id => f_recommendation.to_param}, valid_session
      response.should redirect_to(f_recommendations_url)
    end
  end

end