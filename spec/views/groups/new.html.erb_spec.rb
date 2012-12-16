require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :user_type_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path, :method => "post" do
      assert_select "input#group_user_type_id", :name => "group[user_type_id]"
      assert_select "input#group_name", :name => "group[name]"
    end
  end
end
