TeamDays.OrdersIndexController = Ember.ArrayController.extend({
  actions: {
    delete: (order)->
      order.deleteRecord()
      order.save()
  }
})
