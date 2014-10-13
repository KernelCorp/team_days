# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Test data
service = Service.create name: 'Выпить чаю', price: 20.0, description: 'с малиной'
city = City.create name: 'Новосибирск'

partner = User::Partner.find_or_create_by email: 'partner@example.com', password: 'password', city: city
partner.available_services.build service: service
partner.save



order = Order.new partner: partner, service: partner.available_services.first.service, cost: '100500', status: 'new'
order.build_client_info email: 'client@example.com', name: 'Vasya', phone: '1234567890'
order.save
