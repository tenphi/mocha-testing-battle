Q = require 'q'
testedFunctions = require '../testedCases'
assert = require('chai').assert

checkResult = (result) ->
  assert result is "correct", "incorrect result"

getTesters = (testedFunc) ->
  withDone: (done) ->
    testedFunc().then (result) ->
      checkResult result
      done()

  withoutDoneReturningPromise: ->
    testedFunc().then (result) ->
      checkResult result

  withoutDoneNotReturningPromise: ->
    testedFunc().then (result) ->
      checkResult result

    assert true, "any additional checks here"

describe 'checking different cases with different test approaches', ->
  for testedFuncName, testedFunc of testedFunctions
    testers = getTesters testedFunc
    expectedResult =
      if testedFuncName is "correct"
        "SUCCEED"
      else
        "FAIL"
    describe "tested case: #{testedFuncName}, tests below should: " + expectedResult, ->
      for testerName, tester of testers
        it testerName, tester
