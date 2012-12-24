require 'spec_helper'

describe "f_recommendations/new" do
  before(:each) do
    assign(:f_recommendation, stub_model(FRecommendation,
      :group_id => 1,
      :content => "MyString",
      :low_c => "9.99",
      :high_c => "9.99",
      :low_dc => "9.99",
      :high_dc => "9.99"
    ).as_new_record)
  end

  it "renders new f_recommendation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => f_recommendations_path, :method => "post" do
      assert_select "input#f_recommendation_group_id", :name => "f_recommendation[group_id]"
      assert_select "input#f_recommendation_content", :name => "f_recommendation[content]"
      assert_select "input#f_recommendation_low_c", :name => "f_recommendation[low_c]"
      assert_select "input#f_recommendation_high_c", :name => "f_recommendation[high_c]"
      assert_select "input#f_recommendation_low_dc", :name => "f_recommendation[low_dc]"
      assert_select "input#f_recommendation_high_dc", :name => "f_recommendation[high_dc]"
    end
  end
end
