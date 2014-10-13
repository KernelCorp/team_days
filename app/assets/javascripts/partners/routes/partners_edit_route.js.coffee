# For more information see: http://emberjs.com/guides/routing/

TeamDays.PartnersEditRoute = Ember.Route.extend({
  model: ()->
    @store.find('partner', window.myId)
})
