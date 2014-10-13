TeamDays.OrdersEditRoute = Ember.Route.extend({
  model: (params)->
    @store.find('order', params.id)
})