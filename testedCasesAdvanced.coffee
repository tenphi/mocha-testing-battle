Q = require 'q'
whenJs = require 'when'

assert = require('chai').assert

module.exports =

  correctAdvancedQ: (id) ->
    Q.resolve true

  incorrectAdvancedQ: (id) ->
    then: ->
      then: (cb) ->
        cb(true)
        Q.resolve()
