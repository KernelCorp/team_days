#= require jquery
#= require moment
#= require moment/ru.js
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ./partners/team_days

# for more details see: http://emberjs.com/guides/application/
window.TeamDays = Ember.Application.create( {
  rootElement: '#partners'
})
