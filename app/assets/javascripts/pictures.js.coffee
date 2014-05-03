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

  _maxPicturesCount: ->
    @_fileField().data('max-pictures-count')

  _picturesCount: ->
    $('.uploaded_pictures img').length

  _canUpload: ->
    @_maxPicturesCount() == null || @_picturesCount() < @_maxPicturesCount()

  _update: ->
    $botton = $('div.input.file')
    if @_canUpload()
      $botton.show()
    else
      $botton.hide()

  imagesAdded: (new_picture) ->
    if @_canUpload()
      $new_picture = $(new_picture)
      $('.uploaded_pictures').append $new_picture
      @_refreshIndexes($('.uploaded_pictures input'));
      @_update()
      $new_picture.on 'removed', =>
        @_update()
    else
      console.error 'fail'

$(document).on 'page:update', ->
  new PicturesUploader