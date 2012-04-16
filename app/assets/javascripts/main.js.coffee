$ ->
  $("body").on "click", ".collapsible h4", (e) ->
    $(this).closest('.collapsible').toggleClass 'open'
    #$collapser = $(this)
    #$collapsible = $collapser.next('.collapse')
    #el[0].scrollHeight to get .collapse height

  #todo: only for ie  
  $("article:last-child").addClass "last"


  $("body").on "click", ".highlight .handler", (e) ->
    e.preventDefault()
    $(this).closest('.highlight').toggleClass 'open'

