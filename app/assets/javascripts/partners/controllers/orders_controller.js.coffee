TeamDays.OrdersController = Em.PaginationController.extend({
  queryParams: ['order', 'page']
  page: 1
  modelInfo: {
    store: 'order',
    class: TeamDays.Order
  }
})
