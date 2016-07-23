require('../../src/fluentnode')

describe '| Assert | Function', ->
  it 'assert_Throws', (done)->
    # when exception happens - no param
    (-> throw 'exception test').assert_Throws()
    (-> aaa.bbb()             ).assert_Throws()

    # when exception happens - function as param
    (-> throw 'exception test').assert_Throws (error)->
        error.assert_Is 'exception test'

    # when exception happens - string as param (good value)
    (-> throw 'exception test').assert_Throws 'exception test'

    # when exception happens - string as param (bad value)
    try
      (-> throw 'exception test').assert_Throws 'AAAA'
    catch error
      error.message.assert_Is "Expected exception error to be 'AAAA' but it was 'exception test'"

    # when no exception happens
    try
      (-> 42 == 42)     .assert_Throws()
    catch error
      (error == 'fail') .assert_Is_False()
      error.message.assert_Is 'Missing expected exception. [assert_Throws]'
      done()



  it 'assert_Not_Throws', (done)->
    (-> 42 == 42)       .assert_Not_Throws()
    try
      (-> throws 'fail').assert_Not_Throws()
    catch error
      (error == 'fail') .assert_Is_False()
      done()

  it 'assert_Is_Function', ->
    (->).assert_Is_Function()
    (->).assert_Is_Function.assert_Is_Function()
