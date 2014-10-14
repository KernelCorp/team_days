TeamDays.AvailableServicesShowRoute = Ember.Route.extend({
  model: (params)->
    @store.find('available_service', params.id)

  setupController: (controller, model) ->
    controller.set 'model', model
})

TeamDays.AvailableServicesIndexRoute = Ember.Route.extend({
  model: ->
    @store.findAll('available_service')

})
TeamDays.AvailableServicesEditRoute = Ember.Route.extend({
  model: (params)->
    @store.find('available_service', params.id)
})