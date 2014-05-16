gm = require 'gm'

module.exports = class ImageResizer

  # @param [FileModel] file The image to be resized.
  constructor: (@file) ->

  resize: (params, response) ->
    gm_image = gm @file.storage().read(), @file.storage().filename()

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
    else
      gm_image.resize params.width, params.height, "!"

    # Stream the data for the resized image
    gm_image.stream (error, stdout, stderr) ->
      stdout.pipe response
