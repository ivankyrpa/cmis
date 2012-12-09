class InsuranceType < ActiveRecord::Base

  validates :name, :presence   => true,
                   :length     => { :maximum => 30 },
                   :uniqueness => { :case_sensitive => false }

end
