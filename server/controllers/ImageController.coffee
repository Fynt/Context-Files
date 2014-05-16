Controller = require '../lib/Controller'
FileModel = require '../models/FileModel'
ImageModel = require '../models/ImageModel'
ImageResizer = require '../lib/Image/Resizer'


module.exports = class ImageController extends Controller
  resize_params: ->
    file_id: @params.id
    scale: Number @params.scale or 1
    width: parseInt @params.width
    height: parseInt @params.height
    crop_origin_x: parseInt @params.crop_origin_x or 0
    crop_origin_y: parseInt @params.crop_origin_y or 0
    format: @params.format

  find_image: (done) ->
    resize_params = @resize_params()
    ImageModel.findOne
      where:
        'file_id': resize_params.file_id
        'scale': resize_params.scale
        'width': resize_params.width
        'height': resize_params.height
        'crop_origin_x': resize_params.crop_origin_x
        'crop_origin_y': resize_params.crop_origin_y
        'extension': resize_params.format,
      done

  resize_image: (done) ->
    FileModel.findById @params.id, (error, file) =>
      @abort 500 if error
      @abort 404 if not file

      resizer = new ImageResizer file

      console.log resizer.resize @resize_params

      #@content_type 'image/jpeg'
      @respond "HI"

  find_or_resize_image: (done) ->
    @find_image (error, image) =>
      done image if image

      @resize_image (image) ->
        done image

  show_image_action: ->
    @find_or_resize_image (image) =>
      if image
        @respond image.storage().read()
