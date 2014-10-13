TeamDays.AvailableServicesIndexRoute = Ember.Route.extend({
  model: ->
    @store.findAll('available_service')

})