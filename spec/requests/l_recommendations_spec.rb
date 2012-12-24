require 'spec_helper'

describe "LRecommendations" do
  describe "GET /l_recommendations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get l_recommendations_path
      response.status.should be(200)
    end
  end
end
