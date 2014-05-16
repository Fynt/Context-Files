gm = require 'gm'

module.exports = class ImageResizer

  # @param [FileModel] file The image to be resized.
  constructor: (@file) ->

  resize: (params) ->
    gm_image = gm @file.storage().read()

    # Scale the image if needed.
    if params.scale > 1
      gm_image.magnify params.scale
    else if params.scale < 1
      gm_image.minify params.scale

    # Crop
    if params.crop_origin_x or params.crop_origin_y
      gm_image.crop params.width, params.height, params.crop_origin_x,
        params.crop_origin_y
    # Resize
    else:
      gm_image.resize params.width, params.height, "!"

    # Strip exif data, etc.
    gm_image.noProfile()
