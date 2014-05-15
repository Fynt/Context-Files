Storage = require '../Storage'

# Mock storage adapter for testing, etc.
module.exports = class MockStorage extends Storage

  mimetype: ->
    'text/plain'

  content: ->
    "#{@file.source} is a file!"
