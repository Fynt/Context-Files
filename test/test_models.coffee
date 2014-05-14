assert = require 'assert'
FileModel = require '../server/models/FileModel'

describe 'File', ->
  file = null

  beforeEach (done) ->
    file = new FileModel
    file.save done

  it 'should be a Model', ->
    assert.equal file instanceof FileModel, true

  it 'should have an id', ->
    assert.equal file.id?, true

  it 'should have a created date', ->
    assert.equal file.created?, true
