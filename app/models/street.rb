class Street < ActiveRecord::Base
  has_many :addresses
  
  validates :name, :presence   => true,
                   :length     => { :maximum => 40 },
                   :uniqueness => { :case_sensitive => false }
end
