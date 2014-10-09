# for more details see: http://emberjs.com/guides/models/defining-models/

TeamDays.AvailableService = DS.Model.extend(
  name: DS.attr 'string'
  price: DS.attr 'number'
  description: DS.attr 'string'

)
