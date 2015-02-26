class @Binding_Sliders
  constructor: ->
    $("a.fancybox").fancybox()

    $('.a_other_photos').click @bind_slider

    $('.popup-shadow_report').click @hide_popup_slider
    $('.close_btn').click @hide_popup_slider
    $('#more_about_services-popup .cross_button').click @hide_popup_slider





    $('.services_static_slider').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000})

    $('.slider').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000})
    $('.slider_all_companies').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000})
    $('.video').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000, video: true})
    $('.slider_other_photo_reports').bxSlider({
      prevText: '',
      nextText: '',
      auto: true,
      pause: 6000,
      minSlides: 4,
      maxSlides: 4,
      slideWidth: 255,
      slideMargin: 0,
      onSliderLoad: @on_other_photos_loaded

    })



    $('.more_video').bxSlider({
      prevText: '',
      nextText: '',
      auto: true,
      pause: 6000,
      minSlides: 2,
      maxSlides: 2,
      slideWidth: 480,
      slideMargin: 0

    })
#    console.log('not loaded!!!');
  slider = null
  slider_num = -1

  on_other_photos_loaded: (arg)->
#    console.log('loaded!!!')
    if $("#other_photo_report .slide").length <= 12
      $("#other_photo_report .bx-controls-direction").hide()



  bind_slider: (e) ->
    e.preventDefault()
    slider_num = $(e.target).attr('rel')
#    console.log(slider_num)
    sl = $('#other_photo_report').find(".container_for_hide_slider[rel='" + slider_num + "']").find('.content_for_hide_slider').fadeIn('fast')
    $('#other_photo_report').find(".container_for_hide_slider[rel='" + slider_num + "']").find('.custom_thumb').fadeIn('fast')
    $('#other_photo_report').find(".container_for_hide_slider[rel='" + slider_num + "']").find('.popup-shadow_report').fadeIn('fast')
    slider = sl.find('#slider_other_photos')
    slider.bxSlider({
      prevText: '',
      nextText: '',
      auto: true,
      pause: 6000
      pagerCustom: '.custom_thumb'
    })

  hide_popup_slider: (e) ->
    $('#other_photo_report').find(".container_for_hide_slider[rel='" + slider_num + "']").find('.custom_thumb').fadeOut('fast')
    $('#other_photo_report').find(".container_for_hide_slider[rel='" + slider_num + "']").find('.popup-shadow_report').fadeOut('fast')
#    slider.destroySlider()
    $('#other_photo_report').find(".container_for_hide_slider[rel='" + slider_num + "']").find('.content_for_hide_slider').fadeOut('fast')

#
    $('.popup-shadow_report').hide()

    $('#more_about_services-popup').hide()

#    console.log('slider_num')

#    $("ul").find("[data-slide='" + current + "']");