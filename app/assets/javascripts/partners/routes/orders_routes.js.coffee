TeamDays.OrdersRoute = Ember.Route.extend(TeamDays._PaginatedRouteMixin, {
  queryParams: {
    page: {
      refreshModel: true
    }
    s: {
      refreshModel: true
    }
  },

  model: (params) ->
    queryParams = {}
    if params['s']
      queryParams['q'] = {}
      queryParams['q']['s'] = params['s']
    if params['page']
      queryParams['page'] = params['page']
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