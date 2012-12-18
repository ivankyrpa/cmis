require 'spec_helper'

describe "histories/new" do
  before(:each) do
    assign(:history, stub_model(History,
      :pacient_id => 1,
      :diagnosis_id => 1,
      :treatment_type_id => 1,
      :user_id => 1,
      :number => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => histories_path, :method => "post" do
      assert_select "input#history_pacient_id", :name => "history[pacient_id]"
      assert_select "input#history_diagnosis_id", :name => "history[diagnosis_id]"
      assert_select "input#history_treatment_type_id", :name => "history[treatment_type_id]"
      assert_select "input#history_user_id", :name => "history[user_id]"
      assert_select "input#history_number", :name => "history[number]"
      assert_select "textarea#history_description", :name => "history[description]"
    end
  end
end
