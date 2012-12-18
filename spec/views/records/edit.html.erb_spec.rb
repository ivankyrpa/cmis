require 'spec_helper'

describe "records/edit" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :pacient_id => 1,
      :assignment_id => 1,
      :diagnosis_id => 1,
      :complaints => "MyText",
      :recommendation => "MyText",
      :doctor_name => "MyString"
    ))
  end

  it "renders the edit record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => records_path(@record), :method => "post" do
      assert_select "input#record_pacient_id", :name => "record[pacient_id]"
      assert_select "input#record_assignment_id", :name => "record[assignment_id]"
      assert_select "input#record_diagnosis_id", :name => "record[diagnosis_id]"
      assert_select "textarea#record_complaints", :name => "record[complaints]"
      assert_select "textarea#record_recommendation", :name => "record[recommendation]"
      assert_select "input#record_doctor_name", :name => "record[doctor_name]"
    end
  end
end
