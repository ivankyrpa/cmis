require 'spec_helper'

describe "medicaments/new" do
  before(:each) do
    assign(:medicament, stub_model(Medicament,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new medicament form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => medicaments_path, :method => "post" do
      assert_select "input#medicament_name", :name => "medicament[name]"
    end
  end
end
