class Medicament < ActiveRecord::Base

  has_many :assignments, :dependent => :destroy

  validates :name, :presence   => true,
                   :length     => { :maximum => 40 },
                   :uniqueness => { :case_sensitive => false }

end
