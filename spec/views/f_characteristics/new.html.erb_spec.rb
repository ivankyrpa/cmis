require 'spec_helper'

describe "f_characteristics/new" do
  before(:each) do
    assign(:f_characteristic, stub_model(FCharacteristic,
      :group_id => 1,
      :name => "MyString",
      :norm_c => 1.5,
      :norm_sc => 1.5,
      :norm_dc => 1.5,
      :dev_c => 1.5,
      :dev_sc => 1.5,
      :dev_dc => 1.5
    ).as_new_record)
  end

  it "renders new f_characteristic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => f_characteristics_path, :method => "post" do
      assert_select "input#f_characteristic_group_id", :name => "f_characteristic[group_id]"
      assert_select "input#f_characteristic_name", :name => "f_characteristic[name]"
      assert_select "input#f_characteristic_norm_c", :name => "f_characteristic[norm_c]"
      assert_select "input#f_characteristic_norm_sc", :name => "f_characteristic[norm_sc]"
      assert_select "input#f_characteristic_norm_dc", :name => "f_characteristic[norm_dc]"
      assert_select "input#f_characteristic_dev_c", :name => "f_characteristic[dev_c]"
      assert_select "input#f_characteristic_dev_sc", :name => "f_characteristic[dev_sc]"
      assert_select "input#f_characteristic_dev_dc", :name => "f_characteristic[dev_dc]"
    end
  end
end
