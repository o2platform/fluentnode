require('../../src/fluentnode')

describe 'Assert | Function |', ->
  it 'assert_Throws', (done)->
    (-> throws 'fail')  .assert_Throws()
    try
      (-> 42 == 42)     .assert_Throws()
    catch error
      (error == 'fail') .assert_Is_False()
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