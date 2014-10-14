TeamDays.OrdersController = Ember.ArrayController.extend({
  queryParams: ['order', 'page']
  modelInfo: {
    store: 'order',
    class: TeamDays.Order
  }
})
TeamDays.OrdersIndexController = Ember.ArrayController.extend({
  actions: {
    delete: (order)->
      order.deleteRecord()
      order.save()
  }
})
