require 'spec_helper'

describe "streets/show" do
  before(:each) do
    @street = assign(:street, stub_model(Street,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
