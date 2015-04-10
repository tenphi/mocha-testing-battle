Q = require 'q'

module.exports =

  method: ->
    Q.resolve().delay(100).then -> [1,2,3]

  smartMethodPromiseHack: ->
    {
      then: ->
        catch: ->
    }

  smartMethod: (num) ->
    if num < 7
      Q.reject 'less'
    else if num > 7
      Q.reject 'bigger'
    else
      Q.resolve 'right!'

  smartMethodDoneHack: (num) ->
    if num < 7
      Q.reject 'less'
    else if num > 7
      Q.reject 'bigger'
    else
      return {
        then: ->
          catch: ->
      }
