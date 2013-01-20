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
                              
  scope :firstn, lambda { |*args| find_by_firstname(args.first) } 
  scope :middlen, lambda { |*args| find_by_middlename(args.first) }
  scope :lastn, lambda { |*args| find_by_lastname(args.first) }
  scope :by_sex, lambda { |*args| find_by_sex(args.first) }
  
  scope :by_street, lambda { |*args| find_by_street(args.first) }
  scope :by_district, lambda { |*args| find_by_district(args.first) }
  scope :by_country, lambda { |*args| find_by_country(args.first) }
  scope :by_region, lambda { |*args| find_by_region(args.first) }
  scope :by_settlement, lambda { |*args| find_by_settlement(args.first) }
  scope :by_city, lambda { |*args| find_by_city(args.first) }
  scope :by_house, lambda { |*args| find_by_house(args.first) }
  scope :by_flat, lambda { |*args| find_by_flat(args.first) }
  
  scope :by_diagnosis, lambda { |*args| find_by_diagnosis(args.first) }
  
  def self.search(search)
    if search
      where('lastname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.find_by_firstname(name)
    if name
      where('firstname LIKE ?', "%#{name}%")
    else
      scoped
    end
  end
  
  def self.find_by_middlename(name)
    if name
      where('middlename LIKE ?', "%#{name}%")
    else
      scoped
    end
  end
  
  def self.find_by_lastname(name)
    if name
      where('lastname LIKE ?', "%#{name}%")
    else
      scoped
    end
  end
  
  def self.find_by_street(name_id)
    if name_id.nil? || name_id == ""
      scoped
    else
      where( :addresses => { :street_id => name_id } )
    end
  end
  
  def self.find_by_district(name_id)
    if name_id.nil? || name_id == ""
      scoped
    else
      where( :addresses => { :district_id => name_id } )
    end
  end
  
  def self.find_by_country(name_id)
    if name_id.nil? || name_id == ""
      scoped
    else
      where( :addresses => { :country_id => name_id } )
    end
  end
  
  def self.find_by_region(name_id)
    if name_id.nil? || name_id == ""
      scoped
    else
      where( :addresses => { :region_id => name_id } )
    end
  end
  
  def self.find_by_settlement(name_id)
    if name_id.nil? || name_id == ""
      scoped
    else
      where( :addresses => { :settlement_id => name_id } )
    end
  end
  
  def self.find_by_city(name_id)
    if name_id.nil? || name_id == ""
      scoped
    else
      where( :addresses => { :city_id => name_id } )
    end
  end
  
  def self.find_by_house(number)
    if number.nil? || number == ""
      scoped
    else
      where( :addresses => { :house => number } )
    end
  end
  
  def self.find_by_flat(number)
    if number.nil? || number == ""
      scoped
    else
      where( :addresses => { :flat => number } )
    end
  end
  
  def self.find_by_sex(sex)
    if sex.nil? || sex == "any"
      scoped
    else
      if sex == "male"
        where( :sex => true )
      else
        if sex == "female" 
          where( :sex => false )
        end
      end
    end
  end

  def self.find_by_diagnosis(name_id)
    if name_id.nil? || name_id == ""
      scoped
    else
      joins("RIGHT JOIN histories ON histories.pacient_id = pacients.id").where( "histories.pacient_id = pacients.id and histories.diagnosis_id = #{name_id}")
    end
  end
  
  def fio
    "#{lastname} #{firstname[0]}.#{middlename[0]}."
  end

end
