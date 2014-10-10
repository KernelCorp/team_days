# for more details see: http://emberjs.com/guides/models/defining-models/

TeamDays.Payment = DS.Model.extend
  sum: DS.attr 'number'
  status: DS.attr 'string'
