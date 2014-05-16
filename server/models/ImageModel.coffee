schema = require './schema'
File = require './FileModel'

LocalStorage = require '../lib/Storage/Local'

Image = schema.define 'Image',
  scale:
    type: Number
    limit: 1
    default: 1
  width:
    type: Number
    limit: 4
  height:
    type: Number
    limit: 4
  crop_origin_x:
    type: Number
    limit: 4
    default: 0
  crop_origin_y:
    type: Number
    limit: 4
    default: 0
  source:
    type: schema.String
    limit: 100
  extension:
    type: String
    limit: 4
    index: true
  created:
    type: schema.Date
    default: Date.now

Image.belongsTo File, as: 'source_file', foreignKey: 'file_id'

Image::storage = ->
  new LocalStorage @

module.exports = Image
