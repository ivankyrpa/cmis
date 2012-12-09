require 'spec_helper'

describe "streets/new" do
  before(:each) do
    assign(:street, stub_model(Street,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new street form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => streets_path, :method => "post" do
      assert_select "input#street_name", :name => "street[name]"
    end
  end
end
