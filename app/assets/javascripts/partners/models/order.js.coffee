# for more details see: http://emberjs.com/guides/models/defining-models/

TeamDays.Order = DS.Model.extend TeamDays.FormattedTimestampMixin,
  cost: DS.attr 'number'
  status: DS.attr 'string'
  service_name: DS.attr 'string'
  payment_status: DS.attr 'string'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'

  client_name:  DS.attr 'string'
  client_phone: DS.attr 'string'
  client_email: DS.attr 'string'

  available_service: DS.belongsTo 'availableService'
  payments: DS.hasMany 'payments', async: true