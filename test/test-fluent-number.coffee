require('../src/fluent-number')
#require('../src/assert/fluent-assert')

describe 'fluent-number',->

  it 'random_String',->
    (0).random_String.assert_Is_Function()
    (0).random_String().size().assert_Is_Equal_To(10)
    (1).random_String().size().assert_Is_Equal_To(1)
    (1).random_String().assert_Size_Is(1)
  
  it 'str',->
    (0).str.assert_Is_Function()
    (0).str().assert_Is('0')
    (9).str().assert_Is('9') 

  it 'asd',->
    