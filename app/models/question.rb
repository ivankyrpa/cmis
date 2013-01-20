class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answers, :dependent => :destroy
end
