# For more information see: http://emberjs.com/guides/routing/

TeamDays.Router.map ()->
  @resource 'partners', ->
    @route 'edit'

  @resource 'available_services', ->
    @route 'edit', {path: ':id'}
    @route 'update'
    @route 'show'

  @resource 'orders', ->
    @route 'edit', {path: ':id'}
    @route 'update'
    @route 'show'
    @route 'delete'
