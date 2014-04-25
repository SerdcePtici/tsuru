$(document).on 'page:update', ->
  $('input:file[data-url]').fileupload
    sequentialUploads: true

    fail: (e, data) ->
      console?.log 'data', data
      console?.log data.errorThrown.stack