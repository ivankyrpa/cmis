require 'spec_helper'

describe "insurance_companies/new" do
  before(:each) do
    assign(:insurance_company, stub_model(InsuranceCompany,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new insurance_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insurance_companies_path, :method => "post" do
      assert_select "input#insurance_company_name", :name => "insurance_company[name]"
    end
  end
end
