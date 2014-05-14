fs = require 'fs'
express = require 'express'

module.exports = class Application

  controllers_directory: "./controllers"

  constructor: (@config) ->
    @core = express()

    if @config.routes?
      @register_routes @config.routes

  register_routes: (routes_config) ->
    for method_path, controller_action of routes_config
      method_path = method_path.split " "
      controller_action = controller_action.split "#"

      # Split up arguments
      method = method_path[0]
      path = method_path[1]
      controller_name = controller_action[0]
      action = controller_action[1]

      controller_class = require "#{@controllers_directory}/#{controller_name}"
      controller = new controller_class @

      @register_route method, path, controller, action

  register_route: (method, path, controller, action) ->
    route = @core.route path
    handle = (request, response) ->
      controller.call_action action, request, response

    switch method
      when '*' then route.all handle
      when 'GET' then route.get handle
      when 'POST' then route.post handle
      when 'PUT' then route.put handle
      when 'DELETE' then route.delete handle

  start: ->
    @core.listen @config.server.port
