class @PicturesUploader
  instance = null

  @instance: ->
    instance

  constructor: ->
    instance = this

    # Initialize file field with jQuery File Upload
    @_fileField().fileupload
      sequentialUploads: true
      dropZone: $ 'body'

      fail: (e, data) ->
        console?.log 'Picture upload error', data
        console?.error data.errorThrown.stack if data.errorThrown.stack

  _refreshIndexes: (inputs) ->
    inputs.each (index, input) ->
      input.name = input.name.replace /\[\d+\]/, "[#{index}]"
      input.id = input.id.replace /_\d+_/, "_#{index}_"

  _fileField: ->
    $('.pictures_uploader input:file[data-url]')

  _update: ->
    $button = $('div.input.file')
    if @canUpload()
      $button.show()
    else
      $button.hide()
    $('.pictures_uploader').trigger('updated', [this])

  canUpload: ->
    @maxPicturesCount() == null || @picturesCount() < @maxPicturesCount()

  maxPicturesCount: ->
    @_fileField().data('max-pictures-count')

  picturesCount: ->
    $('.uploaded_pictures img').length

  imagesAdded: (new_picture) ->
    if @canUpload()
      $new_picture = $(new_picture)
      $('.uploaded_pictures').append $new_picture
      @_refreshIndexes($('.uploaded_pictures input'));
      @_update()
      $new_picture.on 'removed', =>
        @_update()

addPicturesFormUpdate = (uploader) ->
  $submitButton = $('.add-pictures-form input[type=submit]')
  if uploader.picturesCount() > 0
    $submitButton.show()
  else
    $submitButton.hide()

$(document).on 'page:update', ->
  uploader = new PicturesUploader
  addPicturesFormUpdate uploader

$(document).on 'updated', '.add-pictures-form .pictures_uploader', (e, uploader) ->
  addPicturesFormUpdate uploader