TeamDays.AvailableServicesEditRoute = Ember.Route.extend({
  model: (params)->
    @store.find('available_service', params.id)

  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'available_services')
})