jQuery ->
  $(".reciver_autocomplete").autocomplete
    source: $(".reciver_autocomplete").data("autocomplete-source")