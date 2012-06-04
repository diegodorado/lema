initScrollorama= ->
  #scrollorama
  window.scrollorama = $.scrollorama
    blocks: ".scrollblock"
    enablePin: false

  space = (object, end,duration=1000)->
    end = end + parseInt($("#space-#{object}").css('top'),10)
    delay = 0
    scrollorama.animate "#space-#{object}", {duration: duration, property: "top",  end: end, delay: delay}

  space "s1", -500
  space "o1-s", 400
  space "o1", -1000
  space "o2-s", 800, 1000
  space "o2", -100
  space "o3-s", 200
  space "o3", -2500
  space "t1-s", 1800, 1000
  space "t1", 200
  space "t2-s", 200



  scrollorama.animate "#eye-eye", {duration: 700,    property: "top",  end: 850, delay: 800}


  duration = 2500
  end2 = duration * 0.49 + 0
  end3 = duration * -1.04 + 686
  end4 = duration * 0.075 + 342
  end5 = duration * 0.019 + 18
  end6 = duration * -0.26 + 407
  end7 = duration * 0.29 + 120

  scrollorama.animate "#building-b2", {duration: duration, property: "top",  end: end2}
  scrollorama.animate "#building-b3", {duration: duration, property: "top",  end: end3}
  scrollorama.animate "#building-b4", {duration: duration, property: "top",  end: end4}
  scrollorama.animate "#building-b5", {duration: duration, property: "top",  end: end5}
  scrollorama.animate "#building-b6", {duration: duration, property: "top",  end: end6}
  scrollorama.animate "#building-b7", {duration: duration, property: "top",  end: end7}

  balls = (ball, end,delay=0)->
    duration = 1000
    end = 1150 + end
    delay = delay + 1000
    scrollorama.animate "#art-#{ball}", {duration: duration, property: "top",  end: end, delay: delay}

  balls "blue-b", 300, -200
  balls "blue-s", 100, 100
  balls "green-b", -200
  balls "green-s", 0, 100
  balls "orange-s", 100, 100
  balls "red-b", -300,100
  balls "red-s", 200, 100
  balls "yellow-b", 200,300
  balls "yellow-s", 200, 100

  scrollorama.animate "#art-tb2 h5", {duration: 500, property: "margin-top",  start: 300, delay: 1600}
  scrollorama.animate "#art-tb2", {duration: 300, property: "top",  end: 1820, delay: 2000}



$ ->

  $("body.trayectoria #years_carousel").carousel
   #long interval to avoid cycle
   interval: 500000000

  $("body").on "click", ".collapsible .arrow-link", (e) ->
    e.preventDefault()
    $(this).closest('.collapsible').toggleClass 'open'
    #$collapser = $(this)
    #$collapsible = $collapser.next('.collapse')
    #el[0].scrollHeight to get .collapse height

  $("body").on "click", ".book-list h3 a", (e) ->
    e.preventDefault()
    $(this).closest('.book').toggleClass 'open'


  $("body.capacitacion").on "click", ".collapsible.categories .right", (e) ->
    e.preventDefault()
    $(this).closest('.collapsible').toggleClass 'open'




  $("body.ie7 article:last-child").addClass "last"


  $(window).load ->
    #font fully loaded
    $wrapper = $(".highlight .wrapper")
    if $wrapper.size()
      height = $wrapper.height()
      $wrapper.data 'height', height
      $wrapper.height height

  $("body").on "click", ".highlight .handler", (e) ->
    e.preventDefault()
    $highlight = $(this).closest('.highlight')
    $wrapper = $highlight.find('.wrapper')

    if $highlight.hasClass 'open'
      $wrapper.css 'height', $wrapper.css('min-height')
    else
      $wrapper.height $wrapper.data('height')
    
    $highlight.toggleClass 'open'



  $('.course-tabs a').click (e) ->
    e.preventDefault()
    $(this).tab('show')


  initScrollorama() if  $("body.home").size()

  #open external links in new window
  $(document.links).filter( () -> @hostname != window.location.hostname).attr('target', '_blank')



