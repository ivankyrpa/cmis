class BloodGroup < ActiveRecord::Base

  validates :name, :presence   => true,
                   :length     => { :maximum => 40 },
                   :uniqueness => { :case_sensitive => false }
  
  
end
