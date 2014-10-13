TeamDays.OrdersRoute = Ember.Route.extend({
  queryParams: {
    order: {
      refreshModel: true
    }
  }
  model: (params) ->
    queryParams = {}
    if params['order']
      queryParams['order'] = params['order']
    if params['page']
      queryParams['page'] = params['page']
    @store.find('order', queryParams)

})