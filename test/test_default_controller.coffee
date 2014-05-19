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
    req.get('/health-check').expect(200).end (error, res) ->
      assert.equal error, null

  it 'does not have a health-chuck', ->
    req.get('/health-chuck').expect(404).end (error, res) ->
      assert.equal error, null
