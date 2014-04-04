$(document).on 'ajax:error', (e, xhr, status, error) ->
  console?.log 'error', error
  console?.log 'xhr',xhr
  console?.log 'status', status
