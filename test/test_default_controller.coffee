request = require 'supertest'
assert = require 'assert'

config = require('konfig')()
Application = require '../server/Application'



describe 'Default Controller', ->
  req = null

  before (done) ->
    app = new Application config
    req = request app.core

    done()

  it 'has a health-check', ->
    req.get('/health-check2').expect 200
