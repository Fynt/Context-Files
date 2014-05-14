fs = require 'fs'
express = require 'express'

module.exports = class Application

  constructor: (@config) ->
    @core = express()

    if @config.routes?
      @register_routes @config.routes

  register_routes: (routes_config) ->
    for k, v in routes_config
      console.log k, v

  start: ->
    @core.listen @config.server.port
