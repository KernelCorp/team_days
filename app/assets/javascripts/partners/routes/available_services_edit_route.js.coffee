TeamDays.AvailableServicesEditRoute = Ember.Route.extend({
  model: (params)->
    @store.find('available_service', params.id)
})