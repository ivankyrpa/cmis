require 'spec_helper'

describe "medicaments/edit" do
  before(:each) do
    @medicament = assign(:medicament, stub_model(Medicament,
      :name => "MyString"
    ))
  end

  it "renders the edit medicament form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => medicaments_path(@medicament), :method => "post" do
      assert_select "input#medicament_name", :name => "medicament[name]"
    end
  end
end
