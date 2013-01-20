require 'spec_helper'

describe "FCharacteristics" do
  describe "GET /f_characteristics" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get f_characteristics_path
      response.status.should be(200)
    end
  end
end
