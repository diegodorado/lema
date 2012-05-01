$ ->

  $("body").on "click", ".collapsible .arrow-link", (e) ->
    e.preventDefault()
    $(this).closest('.collapsible').toggleClass 'open'
    #$collapser = $(this)
    #$collapsible = $collapser.next('.collapse')
    #el[0].scrollHeight to get .collapse height

  $("body.obra").on "click", ".book-list h3 a", (e) ->
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


initScrollorama: ->
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

