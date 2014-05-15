Controller = require '../lib/Controller'
FileModel = require '../models/FileModel'

module.exports = class FileController extends Controller

  upload_file_action: ->
    file = new FileModel
      source: 'test.txt'
      extension: 'txt'

    file.save (err, file) =>
      @respond file

  get_file_action: ->
    FileModel.findById @params.id, (error, file) =>
      if file and not error
        @respond file
      else
        @abort 404
