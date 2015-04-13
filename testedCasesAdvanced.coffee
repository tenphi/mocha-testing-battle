Q = require 'q'
whenJs = require 'when'

module.exports =

  correctAdvancedQ: (id) ->
    # should not receive id
    Q.resolve().then ->
      if id?
        Q.resolve 'invalid'
      else
        Q.resolve 'correct'

  incorrectAdvancedQ: (id) ->
    Q.resolve().then ->
