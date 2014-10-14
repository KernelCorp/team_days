TeamDays.OrdersRoute = Ember.Route.extend(TeamDays._PaginatedRouteMixin, {
  queryParams: {
    page: {
      refreshModel: true
    }
  },

  model: (params) ->
    queryParams = {}
    if params['order']
      queryParams['order'] = params['order']
    if params['page']
      queryParams['page'] = params['page']
    @store.find('order', queryParams).then(@_includePagination);

})

TeamDays.OrdersEditRoute = Ember.Route.extend({
  model: (params)->
    @store.find('order', params.id)
})