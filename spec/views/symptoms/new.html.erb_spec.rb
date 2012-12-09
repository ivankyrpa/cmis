require 'spec_helper'

describe "symptoms/new" do
  before(:each) do
    assign(:symptom, stub_model(Symptom,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new symptom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => symptoms_path, :method => "post" do
      assert_select "input#symptom_name", :name => "symptom[name]"
    end
  end
end
