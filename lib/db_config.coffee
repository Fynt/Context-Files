ActiveRecord = require 'activerecord'

module.exports = new ActiveRecord.Configuration
  sqlite:
    database: "data.db"
