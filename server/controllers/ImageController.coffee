Controller = require '../lib/Controller'
FileModel = require '../models/FileModel'

module.exports = class ImageController extends Controller
  find_or_fail: (id, done) ->
    FileModel.findById id, (error, file) =>
      @abort 500 if error
      @abort 404 if not file

      done file

  show_image_action: ->
    @find_or_fail @params.id, (file) =>
      @respond file.storage().content()
