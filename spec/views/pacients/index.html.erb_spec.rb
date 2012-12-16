require 'spec_helper'

describe "pacients/index" do
  before(:each) do
    assign(:pacients, [
      stub_model(Pacient,
        :lastname => "Lastname",
        :middlename => "Middlename",
        :firstname => "Firstname",
        :sex => false,
        :phone => "Phone",
        :address_id => 1,
        :age_group_id => 2,
        :blood_group_id => 3
      ),
      stub_model(Pacient,
        :lastname => "Lastname",
        :middlename => "Middlename",
        :firstname => "Firstname",
        :sex => false,
        :phone => "Phone",
        :address_id => 1,
        :age_group_id => 2,
        :blood_group_id => 3
      )
    ])
  end

  it "renders a list of pacients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Middlename".to_s, :count => 2
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
