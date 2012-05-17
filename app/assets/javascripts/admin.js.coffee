#= require markdown-editor
#= require showdown
#= require jquery.autogrow
#= require_self

window.init_textarea= ->
  #set textareas width same as live-preview
  #hidden textareas also must have explicit width for autogrow to work propperly
  $("textarea:not(.editor-body)").width $("textarea:visible").next('.live-preview').width()
  $("textarea:not(.editor-body)").autogrow()
  #must be last becuase selector
  $("textarea:not(.editor-body)").markdownEditor()
  
  
