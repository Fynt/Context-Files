fs = require 'fs'
express = require 'express'

module.exports = class Application

  constructor: (@config) ->
    @core = express()

  register_controllers: (controller_dir='controllers') ->
    controller_files = fs.readdirSync "#{__dirname}/#{controller_dir}"
    controller_files.forEach (controller_file) =>
      controller_name = controller_file.split(".", 1)[0]
      controller_class = require "./#{controller_dir}/#{controller_file}"

      @register_controller controller_name, controller_class

  register_controller: (controller_name, controller_class) ->
    controller = new controller_class @
    for k, v in controller
      console.log k, v

  start: ->
    @core.listen @config.server.port
