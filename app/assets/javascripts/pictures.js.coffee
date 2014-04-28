$uploader = null

$(document).on 'ready page:change', ->
  # Remove previous uploader if exists
  try $uploader.fileupload('destroy')
  $uploader = $('.pictures_uploader input:file[data-url]')

  $uploader.fileupload
    sequentialUploads: true

    fail: (e, data) ->
      console?.log 'Picture upload error', data
      console?.error data.errorThrown.stack if data.errorThrown.stack

@picturesUploader =
  images_added: (new_picture) ->
    $('.uploaded_pictures').append $(new_picture)
    @refresh_indexes($('.uploaded_pictures input'));

  refresh_indexes: (inputs) ->
    inputs.each (index, input) ->
      input.name = input.name.replace /\[\d+\]/, "[#{index}]"
      input.id = input.id.replace /_\d+_/, "_#{index}_"