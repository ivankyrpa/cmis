require 'spec_helper'

describe "insurance_companies/edit" do
  before(:each) do
    @insurance_company = assign(:insurance_company, stub_model(InsuranceCompany,
      :name => "MyString"
    ))
  end

  it "renders the edit insurance_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insurance_companies_path(@insurance_company), :method => "post" do
      assert_select "input#insurance_company_name", :name => "insurance_company[name]"
    end
  end
end
