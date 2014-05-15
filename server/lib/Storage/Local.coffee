fs = require 'fs'
Storage = require '../Storage'

module.exports = class LocalStorage extends Storage

  # Returns the file content
  #
  # @todo Somehow make this more async?
  # @return [String] The file content
  content: ->
    path = "./data/files/#{@file.source}"
    fs.readFileSync path
