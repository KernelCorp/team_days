# for more details see: http://emberjs.com/guides/controllers/

TeamDays.AvailableServicesIndexController = Ember.ArrayController.extend({
  actions: {
    update:  (service, is_active)->
      service.set 'is_active', is_active
      return
  }
})

