require 'spec_helper'

describe "medicaments/show" do
  before(:each) do
    @medicament = assign(:medicament, stub_model(Medicament,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
