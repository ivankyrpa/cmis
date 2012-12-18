require 'spec_helper'

describe "histories/edit" do
  before(:each) do
    @history = assign(:history, stub_model(History,
      :pacient_id => 1,
      :diagnosis_id => 1,
      :treatment_type_id => 1,
      :user_id => 1,
      :number => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => histories_path(@history), :method => "post" do
      assert_select "input#history_pacient_id", :name => "history[pacient_id]"
      assert_select "input#history_diagnosis_id", :name => "history[diagnosis_id]"
      assert_select "input#history_treatment_type_id", :name => "history[treatment_type_id]"
      assert_select "input#history_user_id", :name => "history[user_id]"
      assert_select "input#history_number", :name => "history[number]"
      assert_select "textarea#history_description", :name => "history[description]"
    end
  end
end
