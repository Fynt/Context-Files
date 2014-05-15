fs = require 'fs'
express = require 'express'

# The Application class
#
# @since 0.0.0
module.exports = class Application

  # @property [String] The path to the Controller classes
  controllers_directory: "./controllers"

  # @param [Object] config The Application config
  constructor: (@config) ->
    @core = express()
    @initialize()

  # Initialize the application by registering routes, etc.
  #
  # @private
  initialize: ->
    if @config.routes?
      @register_routes @config.routes

  # Parses routes from the config and registers them
  #
  # @param [Object] routes_config
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

  # @param [String] method
  # @param [String] path
  # @param [Controller] controller
  # @param [String] action
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

  # Starts the event loop to listen for requests.
  start: ->
    @core.listen @config.server.port
