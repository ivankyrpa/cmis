require 'spec_helper'

describe "records/show" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :pacient_id => 1,
      :assignment_id => 2,
      :diagnosis_id => 3,
      :complaints => "MyText",
      :recommendation => "MyText",
      :doctor_name => "Doctor Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Doctor Name/)
  end
end
