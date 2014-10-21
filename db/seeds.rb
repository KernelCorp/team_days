# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Test data
Service.create name: 'Выпить чаю', price: 20.0, description: 'с малиной'
Service.create name: 'Поработить мир', price: 1.0, description: 'без малины'
Service.create name: 'Коллапсировать сверхновую звезду в черную дыру', price: 200.0, description: 'Очень увлекательно. Рекомендуется с бокалом красного вина'
Service.create name: 'Шутки за 300', price: 300.0, description: 'Шутки смешные и неочень.'

sb = ServicesBox.find_or_create_by name: 'all inclusive'
Service.all.each {|s| sb.services << s}
city = City.find_or_create_by name: 'Новосибирск', subdomain: 'nsk'

User::Partner.create email: 'partner@example.com', password: 'password', city: city
partner = User::Partner.find_by  email: 'partner@example.com'
partner.services_boxes << sb

1.upto(10) do |i|
  payment = Payment.create status: 'new', sum: 100
  order = Order.new partner: partner, service: partner.available_services.first.service, cost: '100500', status: 'new', payment: payment
  order.build_client_info email: "client@example#{i}.com", name: 'Vasya', phone: '1234567890'
  order.save
end
