require 'spec_helper'

describe "settlements/new" do
  before(:each) do
    assign(:settlement, stub_model(Settlement,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new settlement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settlements_path, :method => "post" do
      assert_select "input#settlement_name", :name => "settlement[name]"
    end
  end
end
