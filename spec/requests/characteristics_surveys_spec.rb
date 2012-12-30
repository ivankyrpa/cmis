require 'spec_helper'

describe "CharacteristicsSurveys" do
  describe "GET /characteristics_surveys" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get characteristics_surveys_path
      response.status.should be(200)
    end
  end
end
