Q = require 'q'
whenJs = require 'when'

module.exports =

  correctQ: ->
    Q "correct"

  xcorrectWhen: ->
    whenJs "correct"

  incorrectQPromiseResolvedWithWrongValue: ->
    Q "incorrect"

  xincorrectWhenPromiseResolvedWithWrongValue: ->
    Q "incorrect"

  incorrectQPromiseNotResolved: ->
    Q.defer().promise

  xincorrectWhenPromiseNotResolved: ->
    whenJs.promise (resolve) ->

  incorrectQPromiseReject: ->
    Q.reject new Error "reject"

  xincorrectWhenPromiseReject: ->
    whenJs.reject new Error "reject"

  incorrectThrow: ->
    throw new Error "throw"

  incorrectMockPromiseNotResolved: ->
    { then: -> }

