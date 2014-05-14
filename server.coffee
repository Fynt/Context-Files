global.config = require('konfig')()
console.log global.config.server.port


# express = require 'express'
#
# class Server
#
#   constructor: ->
#     @app = express()
#     @app.get '/', (req, res) ->
#       res.end "Herp Derp!"
#
#   run: (port=5000) ->
#     @app.listen port
#
# server = new Server()
# server.run()
