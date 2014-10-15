# For more information see: http://emberjs.com/guides/routing/

TeamDays.Router.map ()->
  @resource 'partners', ->
    @route 'edit'

  @resource 'available_services', ->
    @route 'edit', {path: ':id/edit'}
    @route 'update'
    @route 'show', {path: ':id'}


  @resource 'orders', ->
    @route 'edit', {path: ':id/edit'}
    @route 'update'
    @route 'show', {path: ':id'}
    @route 'delete'

  @resource 'payments'