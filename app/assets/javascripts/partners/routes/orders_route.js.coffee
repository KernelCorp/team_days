TeamDays.OrdersRoute = Ember.Route.extend({
  queryParams: {
    category: {
      refreshModel: true
    }
  }
  model: ->
    @store.findAll('order')

})