require 'spec_helper'

describe "assignments/edit" do
  before(:each) do
    @assignment = assign(:assignment, stub_model(Assignment,
      :record_id => 1,
      :history_id => 1,
      :medicament_id => 1,
      :amount => "9.99"
    ))
  end

  it "renders the edit assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assignments_path(@assignment), :method => "post" do
      assert_select "input#assignment_record_id", :name => "assignment[record_id]"
      assert_select "input#assignment_history_id", :name => "assignment[history_id]"
      assert_select "input#assignment_medicament_id", :name => "assignment[medicament_id]"
      assert_select "input#assignment_amount", :name => "assignment[amount]"
    end
  end
end
