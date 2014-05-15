global.config = require('konfig')()

Application = require './server/Application'

app = new Application(global.config)

# All of my nope.
# schema = require './server/models/schema'
# schema.automigrate()

app.start()
