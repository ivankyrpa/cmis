class UserType < ActiveRecord::Base
  has_many :users, :dependent => :restrict
  
  validates :name, :presence   => true,
                   :length     => { :maximum => 40 },
                   :uniqueness => { :case_sensitive => false }
end
