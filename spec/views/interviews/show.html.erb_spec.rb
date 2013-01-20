require 'spec_helper'

describe "interviews/show" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :pacient_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
