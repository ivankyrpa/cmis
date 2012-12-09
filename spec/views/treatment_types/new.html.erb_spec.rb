require 'spec_helper'

describe "treatment_types/new" do
  before(:each) do
    assign(:treatment_type, stub_model(TreatmentType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new treatment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => treatment_types_path, :method => "post" do
      assert_select "input#treatment_type_name", :name => "treatment_type[name]"
    end
  end
end
