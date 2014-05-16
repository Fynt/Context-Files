schema = require './schema'
Image = require './ImageModel'

LocalStorage = require '../lib/Storage/Local'

File = schema.define 'File',
  source:
    type: schema.String
    limit: 100
  extension:
    type: schema.String
    limit: 4
    index: true
  created:
    type: schema.Date
    default: Date.now

File.hasMany Image, as: 'images',  foreignKey: 'file_id'

File.validatesPresenceOf 'source', 'extension'

File::storage = ->
  new LocalStorage @

module.exports = File
