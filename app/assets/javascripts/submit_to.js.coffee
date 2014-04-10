submit_form = (input) ->
  input = $ input
  form = input.closest('form')
  _method_input = form.find('input[name="_method"]')
  method = input.data('method')

  old_action = form.attr('action')
  old_method = form.attr('method')

  form.attr 'action', input.data('submit-to')
  form.attr 'method', method if method == 'get' or method == 'post'
  _method_input.val(method)
  form.submit()
  form.attr 'action', old_action
  form.attr 'method', old_method

$(document).on 'change', 'input:file[data-submit-to]', ->
  submit_form @