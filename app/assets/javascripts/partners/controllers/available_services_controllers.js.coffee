TeamDays.AvailableServicesEditController = Ember.ObjectController.extend({
  actions: {
    update: (service)->
      service.set 'price', @get('price')
      service.save().then  =>
        @transitionToRoute('available_services')
  }
})

TeamDays.AvailableServicesIndexController = Ember.ArrayController.extend({
  actions: {
    update:  (service, is_active)->
      service.set 'is_active', is_active
      service.save()
  }
})

