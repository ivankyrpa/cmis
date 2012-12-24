# coding: utf-8
class Pacient < ActiveRecord::Base
  has_one :address, :dependent => :destroy
  has_one :policy,  :dependent => :destroy
  has_many :records, :dependent => :destroy
  has_many :histories, :dependent => :destroy
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :policy

  #scope :lastn, where('lastname LIKE ?', "%#{:lastn}%")
  #scope :firstn, where('firstname LIKE ?', "%#{firstn}%")
  #scope :middlen, where('middlename LIKE ?', "%#{middlen}%")
  #scope :by_degree, proc { |degree| where(:degree => degree) }
  
  lastname_regex = /[a-zA-Zа-яА-Я]+(-|)+[a-zA-Zа-яА-Я]\D/i
  name_regex = /[a-zA-Zа-яА-Я]\D/i
  
  validates :lastname, :presence => true,
                       :format   => lastname_regex
                       
  validates :firstname, :presence => true,
                        :format   => name_regex
                       
  validates :middlename, :presence => true,
                         :format   => name_regex
  
  validates :passport_number, :presence => true,
                              :uniqueness => { :scope=> :passport_seria}

  def self.search(search)
    if search
      where('lastname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.search_by_lastname(lastn)
    if lastn
      where('lastname LIKE ?', "%#{lastn}%")
    else
      scoped
    end
  end

end
