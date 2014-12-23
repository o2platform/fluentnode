require('../../src/assert/Boolean')

describe 'Assert | Boolean',->
  it 'assert_Is_True', ->
    true.assert_Is_True.assert_Is_Function()
    true.assert_Is_True().assert_Is_True()
    (-> false.assert_Is_True()).assert_Throws()

  it 'assert_Is_False', ->
    true.assert_Is_False.assert_Is_Function()
    false.assert_Is_False().assert_Is_False()
    (-> true.assert_Is_False()).assert_Throws()