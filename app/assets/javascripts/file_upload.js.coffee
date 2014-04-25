$(document).on 'page:update', ->
  $('#fileupload').fileupload
    sequentialUploads: true