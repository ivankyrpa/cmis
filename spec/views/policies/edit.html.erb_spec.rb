require 'spec_helper'

describe "policies/edit" do
  before(:each) do
    @policy = assign(:policy, stub_model(Policy,
      :number => "MyString",
      :insurance_company_id => 1,
      :insurance_type_id => 1,
      :pacient_id => 1
    ))
  end

  it "renders the edit policy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => policies_path(@policy), :method => "post" do
      assert_select "input#policy_number", :name => "policy[number]"
      assert_select "input#policy_insurance_company_id", :name => "policy[insurance_company_id]"
      assert_select "input#policy_insurance_type_id", :name => "policy[insurance_type_id]"
      assert_select "input#policy_pacient_id", :name => "policy[pacient_id]"
    end
  end
end
