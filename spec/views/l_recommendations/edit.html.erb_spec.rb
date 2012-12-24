require 'spec_helper'

describe "l_recommendations/edit" do
  before(:each) do
    @l_recommendation = assign(:l_recommendation, stub_model(LRecommendation,
      :group_id => 1,
      :content_o => "MyText",
      :content_c => "MyText",
      :content_d => "MyText",
      :low => 1,
      :high => 1,
      :min => 1
    ))
  end

  it "renders the edit l_recommendation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => l_recommendations_path(@l_recommendation), :method => "post" do
      assert_select "input#l_recommendation_group_id", :name => "l_recommendation[group_id]"
      assert_select "textarea#l_recommendation_content_o", :name => "l_recommendation[content_o]"
      assert_select "textarea#l_recommendation_content_c", :name => "l_recommendation[content_c]"
      assert_select "textarea#l_recommendation_content_d", :name => "l_recommendation[content_d]"
      assert_select "input#l_recommendation_low", :name => "l_recommendation[low]"
      assert_select "input#l_recommendation_high", :name => "l_recommendation[high]"
      assert_select "input#l_recommendation_min", :name => "l_recommendation[min]"
    end
  end
end
