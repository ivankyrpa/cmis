require 'spec_helper'

describe "settlements/edit" do
  before(:each) do
    @settlement = assign(:settlement, stub_model(Settlement,
      :name => "MyString"
    ))
  end

  it "renders the edit settlement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settlements_path(@settlement), :method => "post" do
      assert_select "input#settlement_name", :name => "settlement[name]"
    end
  end
end
