class Assignment < ActiveRecord::Base
  belongs_to :record
  belongs_to :history
end
