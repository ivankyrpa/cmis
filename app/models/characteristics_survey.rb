class CharacteristicsSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :characteristic
end
