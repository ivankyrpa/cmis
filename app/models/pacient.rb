# coding: utf-8
class Pacient < ActiveRecord::Base
  has_one :address, :dependent => :destroy
  has_one :policy,  :dependent => :destroy
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :policy
  
  lastname_regex = /[a-zA-Zа-яА-Я]+(-|)+[a-zA-Zа-яА-Я]\D/i
  name_regex = /[a-zA-Zа-яА-Я]\D/i
  passport_regex = /\d/i
  
  validates :lastname, :presence => true,
                       :format   => lastname_regex
                       
  validates :firstname, :presence => true,
                        :format   => name_regex
                       
  validates :middlename, :presence => true,
                         :format   => name_regex
  
  validates :passport_number, :presence => true,
                              :uniqueness => { :scope=> :passport_seria}                   

end
