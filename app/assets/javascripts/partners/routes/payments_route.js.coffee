# For more information see: http://emberjs.com/guides/routing/

TeamDays.PaymentsRoute = Ember.Route.extend(TeamDays._PaginatedRouteMixin, {
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
    @store.find('payment', queryParams).then(@_includePagination);
})
