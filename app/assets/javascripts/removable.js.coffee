$(document).on 'click', 'button[data-remove]', ->
  $(@).closest('[data-removable]').detach().trigger('removed')