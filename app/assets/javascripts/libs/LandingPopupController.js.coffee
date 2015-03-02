class @LandingPopupController
  constructor: ->
    $('.popup-shadow').click @hide_popup
    $('.cross_button').click @hide_popup
    $('.close_button').click @hide_popup
    $('.popup-link_call').click @show_popup
    $('.popup-link_service').click @show_popup_service
    $('.popup-link_order').click @show_popup_order
    $('.popup-link_more_about_service').click @show_popup_order_more_about_service


#    $('#modal_form .content').click @hide_popup

    $('#modal_form form').bind 'ajax:success', @form_success
    $('#modal_form form').bind 'ajax:error', @form_error

    $('#modal_form_service form').bind 'ajax:success', @form_success_service
    $('#modal_form_service form').bind 'ajax:error', @form_error_service

    $('#modal_form_order form').bind 'ajax:success', @form_success_order
    $('#modal_form_order form').bind 'ajax:error', @form_error_order

    $('#first_form').bind 'ajax:success', @form_success_order
    $('#first_form').bind 'ajax:error', @form_error_first

    $('#second_form').bind 'ajax:success', @form_success_order
    $('#second_form').bind 'ajax:error', @form_error_second

  check = false
  slide_all_services = null

  show_popup: (e) ->
    e.preventDefault()
    $('#modal_form').fadeIn('slow')
    service_id = $(e.target).attr('data-serviceid')
    $('#modal_form form input[name="order[service_id]"]').val service_id

  show_popup_service: (e) ->
    e.preventDefault()
    $('#modal_form_service').fadeIn('slow')
    service_id = $(e.target).attr('data-serviceid')
    $('#modal_form_service form input[name="order[service_id]"]').val service_id

  show_popup_order: (e) ->
    e.preventDefault()
    $('#modal_form_order').fadeIn('slow')
    service_id = $(e.target).attr('data-serviceid')
    $('#modal_form_order form input[name="order[service_id]"]').val service_id

  show_popup_order_more_about_service: (e) ->
#    slide_all_services
#    slide_all_services.destroySlider()
    $('#more_about_services-popup .popup-shadow_report').fadeIn('slow')
    e.preventDefault()
    slide_num = $(e.target).attr('rel')
#    console.log(slide_num)
    $('#more_about_services-popup').fadeIn('slow')
    if check == false
      check = true
      slide_all_services = $('.popup_slider_all_services').bxSlider({
        prevText: '', nextText: '', auto: true, pause: 5000})

      $('#more_about_services-popup .prev').click ->
        slide_all_services.goToPrevSlide()
        false
      $('#more_about_services-popup .next').click ->
        slide_all_services.goToNextSlide()
        false
    slide_all_services.goToSlide(slide_num)
#    service_id = $(e.target).attr('data-serviceid')
#    $('#modal_form_order form input[name="order[service_id]"]').val service_id

  hide_popup: (e) ->
    $('#modal_form').hide()
    $('#modal_form_service').hide()
    $('#modal_form_order').hide()
    $('#success-popup').hide()
    $('#success-popup_service').hide()
    $('#success-popup_order').hide()
    $('.pupup_video').hide()
#    document.querySelector("video").pause()
#    $('.pupup_video .embed_video').stopVideo()
#    $('.embed_video0').stopVideo()
    #    $('#more_about_services-popup').hide()

#    slide_all_services = $('.bxslider').bxSlider();

#    console.log('popup_video')

  form_success: ->
    $('#modal_form').hide()
#    $('#modal_form_service').hide()
#    $('#modal_form_order').hide()
    $('#success-popup').fadeIn('fast')
#    $('#success-popup_service').fadeIn('slow')
#    $('#success-popup_order').fadeIn('slow')
  form_success_service: ->
#    $('#modal_form').hide()
    $('#modal_form_service').hide()
#        $('#modal_form_order').hide()
#    $('#success-popup').fadeIn('slow')
    $('#success-popup_service').fadeIn('fast')
#        $('#success-popup_order').fadeIn('slow')

  form_success_order: ->
#    $('#modal_form').hide()
    $('#modal_form_order').hide()
    #        $('#modal_form_order').hide()
    #    $('#success-popup').fadeIn('slow')
    $('#success-popup_order').fadeIn('fast')
    #        $('#success-popup_order').fadeIn('slow')


    return false

  form_error: ->
    return false