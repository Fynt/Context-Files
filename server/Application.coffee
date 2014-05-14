express = require 'express'

module.exports = class Application

  constructor: (@config) ->
    @app = express()

  start: ->
    @app.listen @config.server.port
