class Interview < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers
  
  def self.search(search)
    if search.nil? || search == ""
      scoped
    else
      where('pacient_id = ?', "#{search}")
    end
  end
end
