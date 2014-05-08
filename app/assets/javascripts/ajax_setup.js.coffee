$(document).on 'ajax:error', (e, xhr, status, error) ->
  console?.log 'status', status
  console?.log error.stack