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
