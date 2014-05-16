Controller = require '../lib/Controller'
FileModel = require '../models/FileModel'
ImageModel = require '../models/ImageModel'
ImageResizer = require '../lib/Image/Resizer'


module.exports = class ImageController extends Controller
  resize_params: ->
    file_id: @params.id
    scale: @params.scale
    width: @params.width
    height: @params.height
    crop_origin_x: @params.crop_origin_x
    crop_origin_y: @params.crop_origin_y
    format: @params.format

  find_image: (done) ->
    ImageModel.find_by_resize_params @resize_params, (image) ->
      done image

  resize_image: (done) ->
    FileModel.findById @params.id, (error, file) ->
      @abort 500 if error
      @abort 404 if not file

      # resize

  find_or_resize_image: (done) ->
    @find_image (image) =>
      done image if image

      @resize_image (image) ->
        done image

  show_image_action: ->
    @find_or_resize_image (image) =>
      if image
        @respond image.storage().read()
