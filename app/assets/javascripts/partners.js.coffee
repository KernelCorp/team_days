#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require ./partners/lib/ember_pagination
#= require_self
#= require ./partners/team_days

# for more details see: http://emberjs.com/guides/application/
window.TeamDays = Ember.Application.create( {
  rootElement: '#partners'
})
