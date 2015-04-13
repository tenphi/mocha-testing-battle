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
    whenJs "incorrect"

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

  incorrectHomemadePromiseNotResolved: ->
    { then: -> }

  incorrectHomemadePromiseWithBrokenContract: ->
    {
    then: (cb) ->
      cb('correct');
      undefined
    catch: (cb) ->
      cb('error')
      undefined
    }
