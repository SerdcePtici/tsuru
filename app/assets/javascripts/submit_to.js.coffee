submit_form_to = (url, form) ->
  old_action = form.attr('action')
  form.attr 'action', url
  form.submit()
  form.attr 'action', old_action

$(document).on 'change', 'input:file[data-submit-to]', ->
  submit_form_to $(@).data('submit-to') + '.js', $('form')