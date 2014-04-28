$(document).on 'page:update', ->
  $('.pictures_uploader input:file[data-url]').fileupload
    sequentialUploads: true

    fail: (e, data) ->
      console?.log 'Picture upload error', data
      console?.error data.errorThrown.stack if data.errorThrown.stack

@picturesUploader =
  images_added: (dom) ->
    $('.uploaded_pictures').append $(dom)
    @refresh_indexes($('.uploaded_pictures input'));
    #FIXME images appears multiple times on the form

  refresh_indexes: (inputs) ->
    inputs.each (index, input) ->
      input.name = input.name.replace /\[\d+\]/, "[#{index}]"
      input.id = input.id.replace /_\d+_/, "_#{index}_"