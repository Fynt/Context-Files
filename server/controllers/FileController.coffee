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

  delete_file_action: ->
    FileModel.findById @params.id, (err, file) ->
      if err
        @abort 500

      if not file
        @abort 404

      file.destroy (err) ->
        if file and not error
          @respond file
        else
          @abort 404


  show_file_action: ->
    FileModel.findById @params.id, (err, file) ->
      if file and not error
        @respond file
      else
        @abort 404

  download_file_action: ->
    @respond "LOL"
