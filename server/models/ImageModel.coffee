schema = require './schema'
File = require './FileModel'

LocalStorage = require '../lib/Storage/Local'

Image = schema.define 'Image',
  scale:
    type: String
    limit: 3
    default: 0.0
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

Image::find_by_resize_params = (resize_params, done) ->
  @find
    where:
      'file_id': resize_params.file_id
      'scale': resize_params.scale or '0.0'
      'width': resize_params.width
      'height': resize_params.height
      'crop_origin_x': resize_params.crop_origin_x or 0
      'crop_origin_y': resize_params.crop_origin_y or 0
      'format': resize_params.format,
    done

Image::storage = ->
  new LocalStorage @

module.exports = Image
