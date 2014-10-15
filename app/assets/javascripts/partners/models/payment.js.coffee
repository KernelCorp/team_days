# for more details see: http://emberjs.com/guides/models/defining-models/

TeamDays.Payment = DS.Model.extend TeamDays.FormattedTimestampMixin,
  sum:    DS.attr 'number'
  status: DS.attr 'string'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'
  order: DS.belongsTo 'order'

  statusClass: ( ->
    if @get('status') == 'paid' then 'positive' else 'warning'
  ).property('status')

