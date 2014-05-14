schema = require './schema'

module.exports = schema.define 'File',
  created:
    type: schema.Date
    default: Date.now
