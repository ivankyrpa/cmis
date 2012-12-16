# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.create([{ name: 'Самара' }])
Country.create([{ name: 'Россия' }])
Region.create([{ name: 'Самарская' }])
Settlement.create([{ name: 'Село1' }])
District.create([{ name: 'Железнодорожный' }])
Street.create([{ name: 'Авроры' }])
AgeGroup.create([{ from: 0, to: 10 }])
BloodGroup.create([{ name: 'первая' }])
InsuranceCompany.create([{ name: 'Макс-С' }])
InsuranceType.create([{ name: 'ОМС' }])
UserType.create([{ name: 'admin' }, { name: 'лимфолог' }, { name: 'флеболог' }])
