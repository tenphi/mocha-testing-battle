Q = require 'q'

module.exports =

  correct: ->
    Q "correct"

  incorrectPromiseResolvedWithWrongValue: ->
    Q "incorrect"

  incorrectPromiseNotResolved: ->
    Q.defer().promise

  incorrectPromiseReject: ->
    Q.reject new Error "reject"

  incorrectThrow: ->
    throw new Error "throw"

  incorrectMockPromiseNotResolved: ->
    { then: -> }

