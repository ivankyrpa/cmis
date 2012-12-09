class Symptom < ActiveRecord::Base

  validates :name, :presence   => true,
                   :length     => { :maximum => 100 },
                   :uniqueness => { :case_sensitive => false }

end
