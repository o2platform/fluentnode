require('../../src/fluentnode')

assert = require 'assert'

describe 'Assert | Number |', ->
  it 'assert_Bigger_Than',->
    (1).assert_Bigger_Than(0)
    (9).assert_Bigger_Than(5)
    (-> (0).assert_Bigger_Than(-1)).assert_Not_Throws()
    (-> (0).assert_Bigger_Than( 1)).assert_Throws()

    (0).assert_Bigger_Than.assert_Is (0).assert_Above
    (0).assert_Bigger_Than.assert_Is (0).assert_Is_Bigger_Than

  it 'assert_In_Between',->
    (1).assert_In_Between(0,10)
    (10).assert_In_Between(2,11)
    (-1).assert_In_Between(-2,0)
    (-> (0).assert_In_Between(-1,1)).assert_Not_Throws()
    (-> (0).assert_In_Between( 1,2)).assert_Throws (error)->
        error.message.assert_Is('Expected 0 to be between 1 and 2')

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

    new Number(12).assert_Is_Number().assert_Is 12
    Number(12    ).assert_Is_Number().assert_Is 12
    Number(''    ).assert_Is_Number().assert_Is 0    # weird edge case, since Number('') is 0

    #check for Nan (see issue https://github.com/o2platform/fluentnode/issues/57 )
    nan_Error_Message = 'The provided number was a NaN (Not an Number)'
    (-> NaN              .assert_Is_Number()).assert_Throws (error)-> error.message.assert_Is nan_Error_Message
    (-> Number('aaa')    .assert_Is_Number()).assert_Throws (error)-> error.message.assert_Is nan_Error_Message
    (-> new Number('aaa').assert_Is_Number()).assert_Throws (error)-> error.message.assert_Is nan_Error_Message





  it 'assert_Smaller_Than',->
    (0).assert_Smaller_Than(1)
    (5).assert_Smaller_Than(9)
    (-> (-1).assert_Smaller_Than(0)).assert_Not_Throws()
    (-> (1).assert_Smaller_Than( 0)).assert_Throws()
