$(document).ready ()->
  pages = $('body.admin-staffs')
  if pages.length > 0
    image_container = pages.find('image-select')
    image = new Vue
      el: image_container[0]
