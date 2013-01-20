class CharacteristicsSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :characteristic
  belongs_to :f_characteristic
end
