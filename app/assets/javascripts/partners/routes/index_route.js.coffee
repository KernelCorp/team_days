TeamDays.IndexRoute = Ember.Route.extend({
  model: ()->
    @store.find('partner', window.myId)

})