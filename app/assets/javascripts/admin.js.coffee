#= require markdown-editor
#= require showdown
#= require jquery.autogrow
#= require_self

$ ->
  $("textarea").markdownEditor()
  #set textareas width same as live-preview
  #hidden textareas also must have explicit width for autogrow to work propperly
  $("textarea").width $("textarea:visible").next('.live-preview').width()
  $("textarea").autogrow()
