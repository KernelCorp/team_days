# for more details see: http://emberjs.com/guides/models/defining-models/

TeamDays.AvailableService = DS.Model.extend(
  name:           DS.attr 'string'
  price:          DS.attr 'number'
  original_price: DS.attr 'number'
  description:    DS.attr 'string'
  is_active:      DS.attr 'boolean'

)
