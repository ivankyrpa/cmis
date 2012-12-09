require 'spec_helper'

describe "operations/edit" do
  before(:each) do
    @operation = assign(:operation, stub_model(Operation,
      :name => "MyString"
    ))
  end

  it "renders the edit operation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => operations_path(@operation), :method => "post" do
      assert_select "input#operation_name", :name => "operation[name]"
    end
  end
end
