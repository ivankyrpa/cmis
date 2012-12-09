require 'spec_helper'

describe "treatment_types/edit" do
  before(:each) do
    @treatment_type = assign(:treatment_type, stub_model(TreatmentType,
      :name => "MyString"
    ))
  end

  it "renders the edit treatment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => treatment_types_path(@treatment_type), :method => "post" do
      assert_select "input#treatment_type_name", :name => "treatment_type[name]"
    end
  end
end
