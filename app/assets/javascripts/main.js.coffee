obertura= ->
  space = (object, end,duration=1000, delay=0)->
    end = end + parseInt($("#space-#{object}").css('top'),10)
    scrollorama.animate "#space-#{object}", {duration: duration, property: "top",  end: end, delay: delay}

  space "s1", -500
  space "o1-s", 400
  space "o1", -1000
  space "o2-s", 3300, 1100
  space "o2", -100
  #space "o3-s", 200
  space "o3", -2500
  space "t1-s", 3500, 1000
  space "t1", 200
  space "t2-s", -1200, 1000, 800



  scrollorama.animate "#eye-eye", {duration: 1900,    property: "top",  end: 960, delay: 0}


  duration = 2500
  end1 = duration * 0.22 + 0
  end2 = duration * 0.49 + 0
  end3 = duration * -1.04 + 686
  end4 = duration * 0.075 + 342
  end5 = duration * 0.39 + 18
  end6 = duration * -0.26 + 407
  end7 = duration * 0.29 + 120
  duration = 5000

  scrollorama.animate "#building-b1", {duration: duration, property: "top",  end: end1}
  scrollorama.animate "#building-b2", {duration: duration, property: "top",  end: end2}
  scrollorama.animate "#building-b3", {duration: duration, property: "top",  end: end3}
  scrollorama.animate "#building-b4", {duration: duration, property: "top",  end: end4}
  scrollorama.animate "#building-b5", {duration: duration, property: "top",  end: end5}
  scrollorama.animate "#building-b6", {duration: duration, property: "top",  end: end6}
  scrollorama.animate "#building-b7", {duration: duration, property: "top",  end: end7}

  balls = (ball, end,delay=0)->
    duration = 1100
    scrollorama.animate "#ball-#{ball}", {duration: duration, property: "top",  end: end, delay: delay}

  balls '1-big-red', -150
  balls '2-big-green', -20
  balls '3-big-blue', -80
  balls '4-medium-blue_red', -120
  balls '5-small-orange_yellow_green', -100


  scrollorama.animate "#balls-tb1 h5", {duration: 500, property: "margin-top",  start: 300, delay: 500}
  #scrollorama.animate "#balls-tb1", {duration: 300, property: "top",  end: 500, delay: 600}



$ ->




  $("body.trayectoria #years_carousel").carousel
   #long interval to avoid cycle
   interval: 500000000




  $(window).load ->
    #font fully loaded
    
    #disable css transitions
    $('body').addClass 'no-transitions'
    
    #sets open sidebar height
    $(".sidebar .collapsible.open > .arrow-link").each (i,el) ->
      collapsible = $(el).closest('.collapsible')
      collapse = collapsible.find('.collapse')
      collapse.height( collapse.find('.markdown').height() + 0 ) #plus ul margin-top

    #sets open highlight wrapper height
    $(".highlight.open .collapse").each (i,el) ->
      $(el).height(  $(el).find('.wrapper').outerHeight())  # plus wrapper padding

      
    #enable css transitions
    setTimeout (-> $('body').removeClass 'no-transitions') , 500




  $("body").on "click", ".sidebar .collapsible > .arrow-link", (e) ->
    collapse = $(this).closest('.collapsible').find('.collapse')
    if collapse.height() is 0
      collapse.height( collapse.find('.markdown').height() + 0 ) #plus ul margin-top
    else
      collapse.height 0


  $("body").on "click", ".collapsible > .arrow-link", (e) ->
    e.preventDefault()
    $(this).closest('.collapsible').toggleClass 'open'


  $("body.capacitacion").on "click", ".collapsible.categories .right", (e) ->
    e.preventDefault()
    collapsible = $(this).closest('.collapsible')
    collapse = collapsible.find('.collapse')
    if collapse.height() is 0
      collapse.height( collapse.find('.category-list').height() + 12 ) #plus ul margin-top
    else
      collapse.height 0
    
    collapsible.toggleClass 'open'

  $("body").on "click", ".highlight .handler", (e) ->
    e.preventDefault()
    highlight = $(this).closest('.highlight')
    collapse = highlight.find('.collapse')

    if collapse.height() < 100 #min height is 85
      h = collapse.find('.wrapper').outerHeight() + 16  # plus wrapper padding
    else
      h = 85

    collapse.find('.wrapper .container').animate
      opacity: 0
    ,200, ->
      collapse.animate
        height: h
      ,200, ->
        highlight.toggleClass 'open'
        collapse.find('.wrapper .container').animate
          opacity: 1
        ,200
      
    




  $("body").on "click", ".arrow-link .pdf-link", (e) ->
    e.preventDefault()
    e.stopPropagation() #to avoid arrow-link effect
    window.location = $(this).attr('href')



  $("body").on "click", ".arrow-link.hojear-link", (e) ->
    e.preventDefault()
    $(@).next('.hidden').find('.photo-list a:first').click()


  #ie7 last-child FIX
  $("html.ie7 article:last-child").addClass "last"

  $('header').css 'backgroundPositionX', '50%'

  $("#search_query").on( "focus", (ev) ->
    $(@).val ""  if $(@).val() is $(@).attr("placeholder")
  ).on('blur',(ev) ->
    $(@).val $(@).attr("placeholder")  if $(@).val() is ""
  ).trigger 'blur'

  $("#search_submit").on "click", (ev) ->
    $sq = $("#search_query")
    if $sq.val() is $sq.attr("placeholder")
      ev.preventDefault()
      $sq.trigger 'focus'


  $('.course-tabs a').click (e) ->
    e.preventDefault()
    $(this).tab('show')


  #scrollorama
  window.scrollorama = $.scrollorama
    blocks: ".scrollblock"
    enablePin: false

  if  $("body.home.index").size()
    obertura() 
  else
    scrollorama.animate "#white-stars", {duration: 10000, property: "top",  end: 2000, delay: 0}
    scrollorama.animate "#grey-stars", {duration: 10000, property: "top",  end: 800, delay: 0}


  #open external links in new window
  $(document.links).filter( () -> @hostname != window.location.hostname).attr('target', '_blank')



  #disable post title links
  $("article.post a.title").on "click", (ev) ->
    ev.preventDefault()


