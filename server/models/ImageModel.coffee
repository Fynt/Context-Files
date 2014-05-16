schema = require './schema'

Image = schema.define 'Image',
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
  format:
    type: String
    limit: 4
    index: true
  created:
    type: schema.Date
    default: Date.now

module.exports = Image
