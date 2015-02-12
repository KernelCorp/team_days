class @LandingPopupController
  constructor: ->
#    $('#popup-shadow').click @hide_popup
#    $('.popup').click @hide_popup
    $('.popup-shadow').click @hide_popup
    $('.popup-link').click @show_popup

    $('form').bind 'ajax:success', @form_success
    $('form').bind 'ajax:error', @form_error

  show_popup: (e) ->
#    console.log('not loaded!!!')
    e.preventDefault()
#    $('#modal_form .popup-shadow').fadeIn('slow')
    $('#modal_form').fadeIn('slow')
    service_id = $(e.target).attr('data-serviceid')
    $('#modal_form form input[name="order[service_id]"]').val service_id
#    console.log(service_id)
##      cat_id = $(e.target).attr('data-catid')
##      $('#pricelist-popup.popup form input[name="request[category_id]"]').val cat_id
##      name = $(this).attr('id')
##      if $(this).hasClass('pricelist')
##        name = 'pricelist'
##      $('#' + name + '-popup').fadeIn('slow')
#    $('#modal_form .content').fadeIn('slow')
  hide_popup: (e) ->
    $('#modal_form').hide()
    $('#success-popup').hide()
#    if $(e.target).is('.btn-close')
#      e.preventDefault()
#    if $(e.target).is('.popup, #popup-shadow, .btn-close')
#      $('#popup-shadow').hide()
#      $('.popup').hide()

  form_success: ->
    $('#modal_form').hide()
    $('#success-popup').fadeIn('slow')
#    $('#popup-shadow').fadeIn('slow')
#    $('#success-popup').fadeIn('slow')
    return false

  form_error: ->
    return false