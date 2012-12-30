class Characteristic < ActiveRecord::Base
  belongs_to :group
  has_many :characteristics_surveys, :dependent => :destroy
  #has_many :surveys, :through => :characteristics_surveys
  #accepts_nested_attributes_for :characteristics_surveys
end
