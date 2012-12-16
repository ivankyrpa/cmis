class InsuranceCompany < ActiveRecord::Base

  has_many :policies
  
  validates :name, :presence   => true,
                   :length     => { :maximum => 30 },
                   :uniqueness => { :case_sensitive => false }

end
