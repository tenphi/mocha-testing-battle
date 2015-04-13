Q = require 'q'
#testedFunctions = require '../testedCases'
testedFunctions = require '../testedCasesAdvanced'

assert = require('chai').assert

checkResult = (result) ->
  assert result is "correct", "incorrect result"

checkSecondResult = (result) ->
  assert result is "invalid", "incorrect result"

expectPromise = (promise) ->
  assert Q.isPromise(promise), 'it\'s not a promise'
  promise


getTesters = (testedFunc) ->
#  withDone: (done) ->
#    testedFunc().then (result) ->
#      checkResult result
#      done()
#
#  withoutDoneReturningPromise: ->
#    testedFunc().then (result) ->
#      checkResult result
#
#  withoutDoneNotReturningPromise: ->
#    testedFunc().then (result) ->
#      checkResult result
#
#    assert true, "any additional checks here"
#
#  withoutDoneNotReturningPromiseButExpect: ->
#    expectPromise testedFunc().then (result) ->
#      checkResult result

  withPromiseAndAdvancedCheck: ->
  # should still return true on each call
    testedFunc()
    .then (answer) ->
      assert.equal answer, true
      testedFunc()
    .then (answer) ->
      assert.equal answer, true

  withDoneAndAdvancedCheck: (done) ->
    # should still return true on each call
    testedFunc()
    .then( (answer) ->
      assert.equal answer, true
      testedFunc()
    ).then (answer) ->
      assert.equal answer, true
      done()

for testedFuncName, testedFunc of testedFunctions
#skipping test cases
  if (testedFuncName.indexOf 'x') is 0
    continue

  testers = getTesters testedFunc
  expectedResult =
    if (testedFuncName.indexOf "correct") is 0
      "SUCCEED"
    else
      "FAIL"
  describe "tested case: #{testedFuncName}, tests below should: " + expectedResult, ->
    for testerName, tester of testers
      it testerName, tester
