require 'spec_helper'

describe "pacients/show" do
  before(:each) do
    @pacient = assign(:pacient, stub_model(Pacient,
      :lastname => "Lastname",
      :middlename => "Middlename",
      :firstname => "Firstname",
      :sex => false,
      :phone => "Phone",
      :address_id => 1,
      :age_group_id => 2,
      :blood_group_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lastname/)
    rendered.should match(/Middlename/)
    rendered.should match(/Firstname/)
    rendered.should match(/false/)
    rendered.should match(/Phone/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
