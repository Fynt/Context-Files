assert = require 'assert'
config = require('konfig')()
Application = require '../server/Application'


describe 'Application', ->
  application = null

  before (done) ->
    application = new Application config
    done()

  it 'is an Application', ->
    assert.equal application instanceof Application, true

  it 'has a config', ->
    assert.equal application.config instanceof Object, true

  it 'can register controllers', ->
    application.register_controllers()

  it 'has a start method', ->
    assert.equal application.start?, true
