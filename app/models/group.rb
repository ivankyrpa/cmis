class Group < ActiveRecord::Base
  belongs_to :user_type
  has_many :characteristics, :dependent => :destroy
  has_many :f_characteristics, :dependent => :destroy
  has_many :f_recommendations, :dependent => :destroy
  has_many :l_recommendations, :dependent => :destroy
end
