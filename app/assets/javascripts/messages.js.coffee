ready = ->
  $(".reciver_autocomplete").autocomplete
    source: $(".reciver_autocomplete").data("autocomplete-source")
$(document).ready(ready)
$(document).on("page:load", ready)