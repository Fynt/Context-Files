assert = require "assert"
ActiveRecord = require 'activerecord'
FileModel = require "../lib/models/FileModel"

describe 'File', ->
  file = null

  beforeEach (done) ->
    file = new FileModel
    file.save (err) ->
      if err
        console.log err
      else
        done()

  it 'should be a Model', ->
    assert.equal file instanceof ActiveRecord.Model, true

  it 'should have an id', ->
    assert.equal file.id?, true
