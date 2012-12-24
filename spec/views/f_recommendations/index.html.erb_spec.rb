require 'spec_helper'

describe "f_recommendations/index" do
  before(:each) do
    assign(:f_recommendations, [
      stub_model(FRecommendation,
        :group_id => 1,
        :content => "Content",
        :low_c => "9.99",
        :high_c => "9.99",
        :low_dc => "9.99",
        :high_dc => "9.99"
      ),
      stub_model(FRecommendation,
        :group_id => 1,
        :content => "Content",
        :low_c => "9.99",
        :high_c => "9.99",
        :low_dc => "9.99",
        :high_dc => "9.99"
      )
    ])
  end

  it "renders a list of f_recommendations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
