require 'spec_helper'

describe "settlements/show" do
  before(:each) do
    @settlement = assign(:settlement, stub_model(Settlement,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
