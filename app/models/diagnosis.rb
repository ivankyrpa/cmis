class Diagnosis < ActiveRecord::Base

  validates :name, :presence   => true,
                   :length     => { :maximum => 70 },
                   :uniqueness => { :case_sensitive => false }

  validates :code, :presence   => true,
                   :uniqueness => { :case_sensitive => false }
end
