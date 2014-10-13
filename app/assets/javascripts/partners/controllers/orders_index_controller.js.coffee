TeamDays.OrdersIndexController = Ember.ArrayController.extend({
  queryParams: ['order']
  order: 'status asc'
  actions: {
    delete: (order)->
      order.deleteRecord()
      order.save()
    index:( ->
    ).property('order')
  }
})
