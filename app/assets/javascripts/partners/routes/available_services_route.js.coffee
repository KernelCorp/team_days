TeamDays.AvailableServicesRoute = Ember.Route.extend({
  model: ->
    @store.findAll('available_service')

})