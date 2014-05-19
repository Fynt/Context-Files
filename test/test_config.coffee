assert = require 'assert'
config = require('konfig')()


describe 'Config', ->

  it 'should contain server settings', ->
    assert.equal config.server?, true

  it 'should define db settings', ->
    assert.equal config.server.db?, true

  it 'should define db driver', ->
    assert.equal config.server.db.driver, 'memory'

  it 'should define storage adapter', ->
    assert.equal config.server.storage, 'Mock'
