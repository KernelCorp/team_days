TeamDays.OrdersController = Ember.ArrayController.extend({
  queryParams: ['order', 'page']
  modelInfo: {
    store: 'order',
    class: TeamDays.Order
  }
})
