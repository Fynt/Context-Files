fs = require 'fs'
Storage = require '../Storage'


module.exports = class LocalStorage extends Storage

  # Gets the local file path
  #
  # @private
  local_path: ->
    "./data/files/#{@file.source}"

  # Returns the file content
  #
  # @todo Somehow make this more async?
  # @return [Buffer] The file content
  read: ->
    fs.readFileSync @local_path()

  write: (data) ->
    fs.writeFileSync @local_path(), data
