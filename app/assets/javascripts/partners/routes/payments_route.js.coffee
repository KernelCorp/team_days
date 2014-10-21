# For more information see: http://emberjs.com/guides/routing/

TeamDays.PaymentsRoute = Ember.Route.extend(TeamDays._PaginatedRouteMixin, {
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
    queryParams = {}
    if params['s']
      queryParams['q'] = {}
      queryParams['q']['s'] = params['s']
    if params['page']
      queryParams['page'] = params['page']
    if params['q']
      queryParams['q'] = {}
      Text = params['q']
      regexKey = /&(.+?)=>/gi
      regexValue = /\=>(.+?)&/gi
      while (result = regexKey.exec(Text)) != null
        queryParams['q'][result[1]] =  regexValue.exec(Text)[1]
    @store.find('payment', queryParams).then(@_includePagination);

})
