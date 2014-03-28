$(document).on 'click', 'button[data-remove]', ->
  $(@).closest('[data-removable]').remove()