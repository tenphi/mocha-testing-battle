* install: `npm install`
* run: `npm test`, then read console output from the very beginning

  How to read the output:
  * each test case is a function that either works correctly (1 variant) or incorrectly (multiple variants);
  * each tester implements the same test logic (expects the same behaviour of a tested function), but with different approach
  
  * before testing ever case it displays whether testers should succeed (pass, display green tick) or fail (display red error message)
  * if a tester should fail for a specific case but it succeeds, it is incorrect, and vice versa

* modifying:

  * add new testing approach - extend .//testers.coffee, getTesters
  * add new tested case - extend ./testedCases.coffee 
  * skipping a tested case - prepend 'x' to its name: 'correctQ' -> 'xcorrectQ' 
