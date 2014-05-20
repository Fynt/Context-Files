gm = require 'gm'
mime = require 'mime'


module.exports = class ImageResizer

  # @param [FileModel] file The image to be resized.
  constructor: (@storage, @params) ->
    @gm_image = gm @storage.read(), @storage.filename()

  # Will return the mime type based on the extension.
  #
  # @return [String] The mime type for the resized image
  mimetype: ->
    mime.lookup @params.extension

  resize: (callback) ->
    # Fix the image orientation.
    @gm_image.autoOrient()

    # Scale the image if needed.
    if @params.scale > 1
      @gm_image.magnify @params.scale
    else if @params.scale < 1
      @gm_image.minify @params.scale

    # Crop
    if @params.crop_origin_x or @params.crop_origin_y
      @gm_image.crop @params.width, @params.height, @params.crop_origin_x,
        @params.crop_origin_y
    # Resize
    else
      if @params.width and not @params.height
        @gm_image.resize @params.width
      else if @params.height and not @params.width
        @gm_image.resize null, @params.height
      else
        @gm_image.resize @params.width, @params.height, ">"

    # Strip EXIF data.
    @gm_image.noProfile()

    @gm_image.stream (error, stdout, stderr) =>
      callback @mimetype(), stdout

  write_to_image: (image, callback) ->
    @gm_image.stream (error, stdout, stderr) ->
      gm(stdout).size (error, size) ->
        image.width = size.width
        image.height = size.height

        callback image
