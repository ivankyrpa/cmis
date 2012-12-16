require 'spec_helper'

describe "pacients/new" do
  before(:each) do
    assign(:pacient, stub_model(Pacient,
      :lastname => "MyString",
      :middlename => "MyString",
      :firstname => "MyString",
      :sex => false,
      :phone => "MyString",
      :address_id => 1,
      :age_group_id => 1,
      :blood_group_id => 1
    ).as_new_record)
  end

  it "renders new pacient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pacients_path, :method => "post" do
      assert_select "input#pacient_lastname", :name => "pacient[lastname]"
      assert_select "input#pacient_middlename", :name => "pacient[middlename]"
      assert_select "input#pacient_firstname", :name => "pacient[firstname]"
      assert_select "input#pacient_sex", :name => "pacient[sex]"
      assert_select "input#pacient_phone", :name => "pacient[phone]"
      assert_select "input#pacient_address_id", :name => "pacient[address_id]"
      assert_select "input#pacient_age_group_id", :name => "pacient[age_group_id]"
      assert_select "input#pacient_blood_group_id", :name => "pacient[blood_group_id]"
    end
  end
end
