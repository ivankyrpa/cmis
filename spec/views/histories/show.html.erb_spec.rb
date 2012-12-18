require 'spec_helper'

describe "histories/show" do
  before(:each) do
    @history = assign(:history, stub_model(History,
      :pacient_id => 1,
      :diagnosis_id => 2,
      :treatment_type_id => 3,
      :user_id => 4,
      :number => "Number",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Number/)
    rendered.should match(/MyText/)
  end
end
