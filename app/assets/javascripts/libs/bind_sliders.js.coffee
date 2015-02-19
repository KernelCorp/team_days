class @Binding_Sliders
  constructor: ->
    $("a.fancybox").fancybox();



    $("a.fancybox_gallary").fancybox({
      openEffect	: 'none',
      closeEffect	: 'none',
      transitionIn: 'elastic'
    })

    $('.services_static_slider').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000})

    $('.slider').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000})
    $('.slider_all_companies').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000})
    $('.video').bxSlider({
      prevText: '', nextText: '', auto: true, pause: 6000})
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

  on_other_photos_loaded: (arg)->
#    console.log('loaded!!!')
    if $("#other_photo_report .slide").length <= 12
      $("#other_photo_report .bx-controls-direction").hide()