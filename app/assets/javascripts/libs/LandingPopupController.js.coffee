class @LandingPopupController
  constructor: ->
    $('.popup-shadow').click @hide_popup
    $('.popup-link').click @show_popup
#    $('#modal_form .content').click @hide_popup

    $('form').bind 'ajax:success', @form_success
    $('form').bind 'ajax:error', @form_error

  show_popup: (e) ->
    e.preventDefault()
    $('#modal_form').fadeIn('slow')
    service_id = $(e.target).attr('data-serviceid')
    $('#modal_form form input[name="order[service_id]"]').val service_id

  hide_popup: (e) ->
    $('#modal_form').hide()
    $('#success-popup').hide()


  form_success: ->
    $('#modal_form').hide()
    $('#success-popup').fadeIn('slow')

    return false

  form_error: ->
    return false