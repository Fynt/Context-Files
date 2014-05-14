assert = require 'assert'
config = require('konfig')()


describe 'Config', ->

  it 'should contain server settings', ->
    assert.equal config.server?, true

  it 'should contain db settings', ->
    assert.equal config.server.db?, true

  it 'should contain db driver', ->
    assert.equal config.server.db.driver, 'memory'
