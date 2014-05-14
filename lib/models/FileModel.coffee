ActiveRecord = require 'activerecord'
config = require '../db_config'

module.exports = class FileModel extends ActiveRecord.Model
  config: config
  fields: ['id']
