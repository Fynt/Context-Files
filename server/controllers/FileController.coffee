Controller = require '../lib/Controller'
FileModel = require '../models/FileModel'

# @todo Reduce some code duplication in here.
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
    FileModel.findById @params.id, (error, file) ->
      if error
        @abort 500

      if not file
        @abort 404

      file.destroy (err) ->
        if file and not error
          @respond file
        else
          @abort 404

  show_file_action: ->
    FileModel.findById @params.id, (error, file) =>
      if file and not error
        @content_type file.storage().mimetype()
        @respond file.storage().content()
      else
        @abort 404

  # Pretty much the same as the show_file_action, but it sets the correct header
  # to force the file to be downloaded.
  download_file_action: ->
    FileModel.findById @params.id, (error, file) =>
      if file and not error
        filename = file.storage().filename()
        @header "Content-Disposition", "inline; filename=\"#{filename}\""
        @content_type "application/force-download"

        @respond file.storage().content()
      else
        @abort 404
