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

  it 'correct: resolve', ->
    Q.all [
      (
        api.smartMethod(6)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'less'
        )
      )

      , (
        api.smartMethod(8)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'bigger'
        )
      )

      , (
        api.smartMethod(7)
        .then( (mes) ->
          assert.equal mes, 'right!'
        , (mes) ->
          assert false, mes
        )
      )
    ]

  it 'incorrect: resolve', ->
    Q.all [
      (
        api.smartMethodPromiseHack(6)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'less'
        )
      )

    , (
        api.smartMethodPromiseHack(8)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'bigger'
        )
      )

    , (
        api.smartMethodPromiseHack(7)
        .then( (mes) ->
          assert.equal mes, 'right!'
        , (mes) ->
          assert false, mes
        )
      )
    ]

describe 'Testing with #done()', ->

  it 'incorrect: done uncalled', (done) ->
    api.method().then ->
      assert false
      done()

  it 'correct: done called', (done) ->
    api.method().then ->
      assert true
      done()

  it 'correct: resolve', (done) ->
    Q.all [
      (
        api.smartMethod(6)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'less'
        )
      )

    , (
        api.smartMethod(8)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'bigger'
        )
      )

    , (
        api.smartMethod(7)
        .then( (mes) ->
          assert.equal mes, 'right!'
        , (mes) ->
          assert false, mes
        )
      )
    ]
    .finally done

  it 'incorrect: resolve', (done) ->
    Q.all [
      (
        api.smartMethodDoneHack(6)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'less'
        )
      )

    , (
        api.smartMethodDoneHack(8)
        .then( (mes) ->
          assert false, mes
        , (mes) ->
          assert.equal mes, 'bigger'
        )
      )

    , (
        api.smartMethodDoneHack(7)
        .then( (mes) ->
          assert.equal mes, 'right!'
        , (mes) ->
          assert false, mes
        )
      )
    ]
    .finally done
