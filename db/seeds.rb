# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Test data
service = Service.create name: 'Выпить чаю', price: 20.0, description: 'с малиной'

partner = User::Partner.find_or_create_by email: 'partner@example.com', password: 'password'
partner.available_services.build service: service
partner.save