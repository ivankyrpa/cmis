class Survey < ActiveRecord::Base
  has_many :characteristics_surveys, :dependent => :destroy
  accepts_nested_attributes_for :characteristics_surveys
  
  def self.search(search)
    if search.nil? || search == ""
      scoped
    else
      where('pacient_id = ?', "#{search}")
    end
  end
end
