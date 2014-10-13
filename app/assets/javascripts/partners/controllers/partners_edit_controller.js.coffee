TeamDays.PartnersEditController = Ember.ObjectController.extend({
  actions: {
    update: (partner)->
      partner.set 'email', @get('email')
      partner.save().then  =>
        @transitionToRoute('/')
  }
})