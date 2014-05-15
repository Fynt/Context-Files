mime = require 'mime'

# @abstract
# @since 0.0.1
module.exports = class Storage

  # @param [Object] file A file model result.
  constructor: (@file) ->

  mimetype: ->
    mime.lookup @file.extension
