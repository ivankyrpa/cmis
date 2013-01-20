class Answer < ActiveRecord::Base
  belongs_to :interview
  belongs_to :question
end
