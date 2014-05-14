global.config = require('konfig')()

Application = require './server/Application'

app = new Application(global.config)
app.start()
