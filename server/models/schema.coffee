caminte = require 'caminte'
Schema = caminte.Schema

db_config = global.config.server.db

module.exports = new Schema db_config.driver, db_config
