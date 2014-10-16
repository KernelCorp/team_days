TeamDays.OrdersRoute = Ember.Route.extend(TeamDays._PaginatedRouteMixin, {
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
      regexKey = new RegExp("^(.+?)=>", 'gi')
      regexValue = new RegExp("=>(.+?)&", 'gi')
      while (result = regexKey.exec(Text)) != null
        queryParams['q'][result[1]] =  regexValue.exec(Text)[1]
    @store.find('order', queryParams).then(@_includePagination);

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