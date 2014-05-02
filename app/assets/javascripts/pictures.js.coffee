@picturesUploader =
  uploader_selector: '.pictures_uploader input:file[data-url]'

  imagesAdded: (new_picture) ->
    $('.uploaded_pictures').append $(new_picture)
    @refreshIndexes($('.uploaded_pictures input'));
    #FIXME upload if there are many uploaders on the page

  refreshIndexes: (inputs) ->
    inputs.each (index, input) ->
      input.name = input.name.replace /\[\d+\]/, "[#{index}]"
      input.id = input.id.replace /_\d+_/, "_#{index}_"

  fileField: ->
    $('.pictures_uploader input:file[data-url]')

  maxPicturesCount: ->
    fileField.data('max_pictures_count')


$uploader = null

$(document).on 'ready page:change', ->
  # Remove previous uploader if exists
  try $uploader.fileupload('destroy')
  $uploader = picturesUploader.fileField()

  $uploader.fileupload
    sequentialUploads: true

    fail: (e, data) ->
      console?.log 'Picture upload error', data
      console?.error data.errorThrown.stack if data.errorThrown.stack