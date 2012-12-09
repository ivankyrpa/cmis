require 'spec_helper'

describe "symptoms/edit" do
  before(:each) do
    @symptom = assign(:symptom, stub_model(Symptom,
      :name => "MyString"
    ))
  end

  it "renders the edit symptom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => symptoms_path(@symptom), :method => "post" do
      assert_select "input#symptom_name", :name => "symptom[name]"
    end
  end
end
