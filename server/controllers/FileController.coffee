Controller = require '../lib/Controller'
FileModel = require '../models/FileModel'

# @todo Reduce some code duplication in here.
module.exports = class FileController extends Controller

  # @todo Make this real!
  upload_file_action: ->
    file = new FileModel
      source: 'test.jpg'
      extension: 'jpg'

    file.save (err, file) =>
      @respond file

  get_file_action: ->
    FileModel.findById @params.id, (error, file) =>
      @abort 500 if error
      @abort 404 if not file

      @respond file

  delete_file_action: ->
    FileModel.findById @params.id, (error, file) ->
      @abort 500 if error
      @abort 404 if not file

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

        @respond file.storage().read()
      else
        @abort 404
