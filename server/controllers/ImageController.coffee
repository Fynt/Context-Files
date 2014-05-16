Controller = require '../lib/Controller'
ImageModel = require '../models/ImageModel'

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

  show_image_action: ->
    @find_image (image) =>
      if image
        @respond file.storage().content()
