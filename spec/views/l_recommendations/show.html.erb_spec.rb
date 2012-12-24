require 'spec_helper'

describe "l_recommendations/show" do
  before(:each) do
    @l_recommendation = assign(:l_recommendation, stub_model(LRecommendation,
      :group_id => 1,
      :content_o => "MyText",
      :content_c => "MyText",
      :content_d => "MyText",
      :low => 2,
      :high => 3,
      :min => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
