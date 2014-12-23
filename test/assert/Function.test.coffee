require('../../src/assert/Function')

describe 'Assert | Function', ->
  it 'assert_Throws', ->
    (-> throws 'fail')  .assert_Throws()
    try
      (-> 42 == 42)     .assert_Throws()
      throw 'fail'
    catch error
      (error == 'fail') .assert_Is_False()

  it 'assert_Not_Throws', ->
    (-> 42 == 42)       .assert_Not_Throws()
    try
      (-> throws 'fail').assert_Not_Throws()
      throw 'fail'
    catch error
      (error == 'fail') .assert_Is_False()

  it 'assert_Is_Function', ->
    (->).assert_Is_Function()
    (->).assert_Is_Function.assert_Is_Function()