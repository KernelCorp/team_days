TeamDays.AvailableServicesShowRoute = Ember.Route.extend({
  model: (params)->
    @store.find('available_service', params.id)

  setupController: (controller, model) ->
    controller.set 'model', model
})