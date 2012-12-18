class Record < ActiveRecord::Base
  belongs_to :pacient

  has_many :assignments, :dependent => :destroy
  accepts_nested_attributes_for :assignments, :reject_if => lambda { |a| a[:amount].blank? }

end
