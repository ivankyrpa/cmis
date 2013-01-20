require 'spec_helper'

describe "interviews/edit" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :pacient_id => 1
    ))
  end

  it "renders the edit interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interviews_path(@interview), :method => "post" do
      assert_select "input#interview_pacient_id", :name => "interview[pacient_id]"
    end
  end
end
