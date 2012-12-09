require 'spec_helper'

describe "blood_groups/edit" do
  before(:each) do
    @blood_group = assign(:blood_group, stub_model(BloodGroup,
      :name => "MyString"
    ))
  end

  it "renders the edit blood_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blood_groups_path(@blood_group), :method => "post" do
      assert_select "input#blood_group_name", :name => "blood_group[name]"
    end
  end
end
