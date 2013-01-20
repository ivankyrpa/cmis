require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :interview_id => 1,
      :question_id => 1,
      :rating => 1
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path, :method => "post" do
      assert_select "input#answer_interview_id", :name => "answer[interview_id]"
      assert_select "input#answer_question_id", :name => "answer[question_id]"
      assert_select "input#answer_rating", :name => "answer[rating]"
    end
  end
end
