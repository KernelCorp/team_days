TeamDays.OrdersRoute = Ember.Route.extend(TeamDays._PaginatedRouteMixin, {
  queryParams: {
    page: {
      refreshModel: true
    }
    s: {
      refreshModel: true
    }
    client_email_cont: {
      refreshModel: true
    }
    client_name_cont: {
      refreshModel: true
    }
    status_eq: {
      refreshModel: true
    }
  },

  model: (params) ->
    queryParams = {}
    if params['s']
      queryParams['q'] = {}
      queryParams['q']['s'] = params['s']
    if params['client_email_cont']
      queryParams['q']['client_email_eq'] = params['client_email_cont']
    if params['client_name_cont']
      queryParams['q']['client_name_eq'] = params['client_name_cont']
    if params['status_eq']
      queryParams['q']['status_eq'] = params['status_eq']
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