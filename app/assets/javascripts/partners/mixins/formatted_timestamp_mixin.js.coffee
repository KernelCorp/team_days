TeamDays.FormattedTimestampMixin = Ember.Mixin.create(
  format: 'DD/M/YYYY в hh:mm',
  formattedCreatedAt: (->
    date = @.get 'created_at'
    format = @.get 'format'
    moment(date).format format
  ).property('created_at', 'format')

  formattedUpdatedAt: (->
    date = @.get 'updated_at'
    format = @.get 'format'
    moment(date).format format
  ).property('updated_at', 'format')


)