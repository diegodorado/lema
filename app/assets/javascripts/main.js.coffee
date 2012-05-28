initScrollorama= ->
  #scrollorama
  window.scrollorama = $.scrollorama
    blocks: ".scrollblock"
    enablePin: false
    
  scrollorama.onBlockChange ->
    i = scrollorama.blockIndex
    current_block = scrollorama.settings.blocks.eq(i).closest('.container').attr("id")
    console.log scrollorama
    $("#console").text "onBlockChange | blockIndex:" + i + " | current block: " + current_block



  scrollorama.animate "#space-t1-s", {duration: 500,    property: "top",  end: 500}
  scrollorama.animate "#space-t1", {duration: 1000,    property: "top",  end: 400}
  scrollorama.animate "#space-o1", {duration: 600,    property: "top",  end: 0}
  scrollorama.animate "#space-o1-s", {duration: 1000,    property: "top",  end: 0}

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


$ ->

  $("body.trayectoria #years_carousel").carousel
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




  #todo: only for ie  
  $("article:last-child").addClass "last"


  $("body").on "click", ".highlight .handler", (e) ->
    e.preventDefault()
    $(this).closest('.highlight').toggleClass 'open'



  $('.course-tabs a').click (e) ->
    e.preventDefault()
    $(this).tab('show')


  initScrollorama() if  $("body.home").size()
  



