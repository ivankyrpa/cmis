class FCharacteristic < ActiveRecord::Base
  belongs_to :group
  has_many :characteristics_surveys, :dependent => :destroy
end
