require 'spec_helper'

describe "characteristics/new" do
  before(:each) do
    assign(:characteristic, stub_model(Characteristic,
      :group_id => 1,
      :name => "MyString",
      :first_value => 1.5,
      :second_value => 1.5
    ).as_new_record)
  end

  it "renders new characteristic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characteristics_path, :method => "post" do
      assert_select "input#characteristic_group_id", :name => "characteristic[group_id]"
      assert_select "input#characteristic_name", :name => "characteristic[name]"
      assert_select "input#characteristic_first_value", :name => "characteristic[first_value]"
      assert_select "input#characteristic_second_value", :name => "characteristic[second_value]"
    end
  end
end
