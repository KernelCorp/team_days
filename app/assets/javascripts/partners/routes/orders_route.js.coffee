TeamDays.OrdersRoute = Ember.Route.extend({
  model: ->
    @store.findAll('order')

})