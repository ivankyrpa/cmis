require 'spec_helper'

describe "f_characteristics/show" do
  before(:each) do
    @f_characteristic = assign(:f_characteristic, stub_model(FCharacteristic,
      :group_id => 1,
      :name => "Name",
      :norm_c => 1.5,
      :norm_sc => 1.5,
      :norm_dc => 1.5,
      :dev_c => 1.5,
      :dev_sc => 1.5,
      :dev_dc => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
