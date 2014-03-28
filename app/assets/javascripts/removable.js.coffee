$(document).on 'click', 'button[data-remove]', (e) ->
  $(@).closest('[data-removable]').remove()
  e.preventDefault()