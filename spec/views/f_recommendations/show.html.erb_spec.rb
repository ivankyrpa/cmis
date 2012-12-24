require 'spec_helper'

describe "f_recommendations/show" do
  before(:each) do
    @f_recommendation = assign(:f_recommendation, stub_model(FRecommendation,
      :group_id => 1,
      :content => "Content",
      :low_c => "9.99",
      :high_c => "9.99",
      :low_dc => "9.99",
      :high_dc => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Content/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
