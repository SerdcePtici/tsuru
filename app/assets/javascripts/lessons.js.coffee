submit_form_to = (url, form) ->
  old_action = form.attr('action')
  form.attr 'action', url
  form.submit()
  form.attr 'action', old_action

$(document).on 'change', 'body.lessons.new input:file', (e) ->
  submit_form_to Routes.upload_pictures_lessons_path(format: 'js'), $('form')