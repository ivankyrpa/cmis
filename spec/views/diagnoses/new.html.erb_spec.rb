require 'spec_helper'

describe "diagnoses/new" do
  before(:each) do
    assign(:diagnosis, stub_model(Diagnosis,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new diagnosis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => diagnoses_path, :method => "post" do
      assert_select "input#diagnosis_name", :name => "diagnosis[name]"
    end
  end
end
