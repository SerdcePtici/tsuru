button_name = '#scroll_to_top'

$ ->
  $(document).scroll->
    $button = $(button_name)
    if $(document).scrollTop()
      $button.show()
    else
      $button.hide()

$(document).on 'click', button_name, ->
  $(document).scrollTop 0