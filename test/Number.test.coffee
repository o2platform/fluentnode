require('../src/Number')

describe 'Number',->

  it 'in_Between', ->
    (10).in_Between( 5,15).assert_True()
    (10).in_Between(-5,15).assert_True()
    (10).in_Between(10,15).assert_False()
    (10).in_Between( 5,10).assert_False()
    (10).in_Between(11,10).assert_False()
    (10).in_Between(11,20).assert_False()
    (10).in_Between( 5,-5).assert_False()

  it 'invoke_After', (done)->
    (0).invoke_After(done)

  it 'random_String',->
    (0).random_String.assert_Is_Function()
    (0).random_String().size().assert_Is_Equal_To(10)
    (1).random_String().size().assert_Is_Equal_To(1)
    (1).random_String().assert_Size_Is(1)
  
  it 'str',->
    (0).str.assert_Is_Function()
    (0).str().assert_Is('0')
    (9).str().assert_Is('9')
    