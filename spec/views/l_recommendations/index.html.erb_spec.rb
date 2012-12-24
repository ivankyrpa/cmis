require 'spec_helper'

describe "l_recommendations/index" do
  before(:each) do
    assign(:l_recommendations, [
      stub_model(LRecommendation,
        :group_id => 1,
        :content_o => "MyText",
        :content_c => "MyText",
        :content_d => "MyText",
        :low => 2,
        :high => 3,
        :min => 4
      ),
      stub_model(LRecommendation,
        :group_id => 1,
        :content_o => "MyText",
        :content_c => "MyText",
        :content_d => "MyText",
        :low => 2,
        :high => 3,
        :min => 4
      )
    ])
  end

  it "renders a list of l_recommendations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
