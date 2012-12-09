require 'spec_helper'

describe "treatment_types/index" do
  before(:each) do
    assign(:treatment_types, [
      stub_model(TreatmentType,
        :name => "Name"
      ),
      stub_model(TreatmentType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of treatment_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
