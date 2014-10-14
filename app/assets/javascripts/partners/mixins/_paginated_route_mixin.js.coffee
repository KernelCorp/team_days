TeamDays._PaginatedRouteMixin = Ember.Mixin.create(
  paginationRoute: Ember.required(String)

# This function is for use in a route that calls find() to get a
# paginated collection of records.  It takes the pagination metadata
# from the store and puts it into the record array.
  _includePagination: (records) =>
    metadata = records.store.typeMapFor(records.type).metadata

    # put the pagination content directly on the collection
    pages = []
    for i in [1..metadata.pagination.total_pages]
      klass = if i == metadata.pagination.current_page then 'item active' else 'item'
      page = {
        num: i
        class: klass
      }
      pages.push page

    records.set "pagination", metadata.pagination
    records.set "pages", pages

    records


  actions:
    gotoPage: (pageNum) ->
      last = @get("controller.content.pagination.total_pages") or 1
      num = pageNum
      @transitionTo @paginationRoute, queryParams: {page: num}
      return

    nextPage: ->
      cur = @get("controller.content.pagination.current_page") or 0
      @transitionTo @paginationRoute, cur + 1
      return

    previousPage: ->
      cur = @get("controller.content.pagination.current_page") or 2
      @transitionTo @paginationRoute, cur - 1
      return

    lastPage: ->
      last = @get("controller.content.pagination.total_pages") or 1
      @transitionTo @paginationRoute, last
      return

    firstPage: ->
      @transitionTo @paginationRoute, 1
      return
)