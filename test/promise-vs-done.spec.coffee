Q = require 'q'
api = require '../api/module'
assert = require('chai').assert

describe 'Testing with promises', ->

  it 'incorrect: reject', ->
    api.method().then ->
      assert false

  it 'correct: resolve', ->
    api.method().then ->
      assert true

  it 'incorrect: resolve', ->
    api.hackMethod().then -> # only name of method changed
      assert false

describe 'Testing with #done()', ->

  it 'incorrect: done uncalled', (done) ->
    api.method().then ->
      assert false
      done()

  it 'correct: done called', (done) ->
    api.method().then ->
      assert true
      done()

  it 'correct: done called', (done) ->
    Q.all [
      api.smartMethod(6)
      .then (mes) ->
        assert false
      .catch (mes) ->
        assert.equal mes, 'less'

      , api.smartMethod(8)
      .then (mes) ->
        assert false
      .catch (mes) ->
        assert.equal mes, 'bigger'

      , api.smartMethod(7)
      .then (mes) ->
        assert.equal mes, 'right!'
      .catch (mes) ->
        assert false
    ]
    .finally done

  it 'incorrect: done called', (done) ->
    Q.all [
      api.smartHackMethod(6) # only name of method changed
      .then (mes) ->
        assert false
      .catch (mes) ->
        assert.equal mes, 'less'

      , api.smartMethod(8)
      .then (mes) ->
        assert false
      .catch (mes) ->
        assert.equal mes, 'bigger'

      , api.smartMethod(7)
      .then (mes) ->
        assert.equal mes, 'right!'
      .catch (mes) ->
        assert false
    ]
    .finally done
