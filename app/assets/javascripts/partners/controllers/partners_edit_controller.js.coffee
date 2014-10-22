TeamDays.PartnersEditController = Ember.ObjectController.extend({
  just_updated: false
  actions: {
    update: (partner)->
      partner.set 'email', @get('email')
      partner.save()
      @just_updated = true
      @transitionToRoute('/')
  }
})