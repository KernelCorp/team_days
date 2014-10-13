# for more details see: http://emberjs.com/guides/models/defining-models/

TeamDays.Order = DS.Model.extend
  cost: DS.attr 'number'
  status: DS.attr 'string'
  service_name: DS.attr 'string'
  available_service: DS.belongsTo 'availableService'
