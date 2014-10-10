TeamDays.AvailableServicesEditController = Ember.Controller.extend({
  actions: {
    update: (service)->
#      service = @store.find('available_service', @get('id'))
      service.set 'price', @get('price')
      service.save()
  }
})