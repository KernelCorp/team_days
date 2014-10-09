# For more information see: http://emberjs.com/guides/routing/

TeamDays.Router.map ()->
  @resource 'partners', ->
    @route 'edit'
    @route 'show'
  @resource 'available_services'
