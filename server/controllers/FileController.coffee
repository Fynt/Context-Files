Controller = require '../lib/Controller'
FileModel = require '../models/FileModel'

module.exports = class FileController extends Controller

  get_file_action: ->
    FileModel.findById @params.id, (error, file) =>
      if file and not error
        @respond file
      else
        @abort 404
