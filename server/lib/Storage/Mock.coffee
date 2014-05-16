Storage = require '../Storage'

# Mock storage adapter for testing, etc.
module.exports = class MockStorage extends Storage

  mimetype: ->
    'text/plain'

  read: ->
    "#{@file.source} is a file!"

  write: (data) ->
    console.log data
