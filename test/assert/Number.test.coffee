require('../../src/assert/assert_Number')

assert = require 'assert'

describe 'Assert | Number', ->
  it 'assert_Is_Equal_To, assert_Is',->
    (0).assert_Is_Equal_To.assert_Is_Function()
    (0).assert_Is_Equal_To(0)
    (-> (0).assert_Is_Equal_To(0)).assert_Not_Throws()
    (-> (0).assert_Is_Equal_To(1)).assert_Throws()
    (0).assert_Is(0)

  it 'assert_Is_Not_Equal_To, assert_Is_Not', ->
    (0).assert_Is_Not_Equal_To.assert_Is_Function()
    (0).assert_Is_Not_Equal_To(1)
    (-> (0).assert_Is_Not_Equal_To(1)).assert_Not_Throws()
    (-> (0).assert_Is_Not_Equal_To(0)).assert_Throws()
    (0).assert_Is_Not(1)

  it 'assert_Is_Number', ->
    (0).assert_Is_Number.assert_Is_Function()
    (0).assert_Is_Number().assert_Is(0)
    (0).assert_Is_Number().assert_Is_Not(10)
