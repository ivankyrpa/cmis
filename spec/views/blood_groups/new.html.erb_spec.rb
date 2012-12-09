require 'spec_helper'

describe "blood_groups/new" do
  before(:each) do
    assign(:blood_group, stub_model(BloodGroup,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new blood_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blood_groups_path, :method => "post" do
      assert_select "input#blood_group_name", :name => "blood_group[name]"
    end
  end
end
