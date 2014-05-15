mime = require 'mime'

# The base storage class
#
# @abstract
# @since 0.0.1
module.exports = class Storage

  # @param [Object] file A file model result.
  constructor: (@file) ->

  # Will return the mime type based on the file extension.
  #
  # @return [String] The mime type for the file
  mimetype: ->
    mime.lookup @file.extension

  # Gets the filename from the source
  filename: ->
    @file.source.split('/').pop()

  # @abstract
  content: -> throw Error "Not implemented"
