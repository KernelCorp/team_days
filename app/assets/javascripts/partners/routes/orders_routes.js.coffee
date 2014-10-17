TeamDays.OrdersIndexRoute = Ember.Route.extend(TeamDays._PaginatedRouteMixin, {

  queryParams: {
    page: {
      refreshModel: true
    }
    s: {
      refreshModel: true
    }
    q: {
      refreshModel: true
    }
  },

  model: (params) ->
    console.log 'route'
    queryParams = {}
    queryParams['q'] = {}
    if params['s']
      queryParams['q']['s'] = params['s']
    if params['page']
      queryParams['page'] = params['page']
    if params['q']
      Text = params['q']
      regexKey = /&(.+?)=>/gi
      regexValue = /\=>(.+?)&/gi
      while (result = regexKey.exec(Text)) != null
        queryParams['q'][result[1]] =  regexValue.exec(Text)[1]
    @store.find('order', queryParams).then(@_includePagination);

  available_services: ->
    @store.findAll('available_service')

  setupController: (controller, model) ->
    controller.set 'available_services', [{name: 'Drink tea', id: 100500}]
    controller.set 'model', model

})
TeamDays.OrdersShowRoute = Ember.Route.extend({
  model: (params)->
    @store.find('order', params.id)

  setupController: (controller, model)->
    controller.set('model', model);
})

TeamDays.OrdersEditRoute = Ember.Route.extend({
  model: (params)->
    @store.find('order', params.id)
})