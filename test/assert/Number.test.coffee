require('../../src/assert/assert_Number')

assert = require 'assert'

describe 'Assert | Number', ->
  it 'assert_Bigger_Than',->
    (1).assert_Bigger_Than(0)
    (9).assert_Bigger_Than(5)
    (-> (0).assert_Bigger_Than(-1)).assert_Not_Throws()
    (-> (0).assert_Bigger_Than( 1)).assert_Throws()

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

it 'assert_Smaller_Than',->
  (0).assert_Smaller_Than(1)
  (5).assert_Smaller_Than(9)
  (-> (-1).assert_Smaller_Than(0)).assert_Not_Throws()
  (-> (1).assert_Smaller_Than( 0)).assert_Throws()
