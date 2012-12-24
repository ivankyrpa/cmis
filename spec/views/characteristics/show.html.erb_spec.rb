require 'spec_helper'

describe "characteristics/show" do
  before(:each) do
    @characteristic = assign(:characteristic, stub_model(Characteristic,
      :group_id => 1,
      :name => "Name",
      :first_value => 1.5,
      :second_value => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
