class Survey < ActiveRecord::Base
  has_many :characteristics_surveys, :dependent => :destroy
  #has_many :characteristics, :through => :characteristics_surveys

  accepts_nested_attributes_for :characteristics_surveys
end
