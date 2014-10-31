require('../src/fluent-number')
require('../src/fluent-assert')

describe 'fluent-number',->

  it 'random_String',->
    (0).random_String.assert_Is_Function()
    (0).random_String().size().assert_Is_Equal_To(10)
    (1).random_String().size().assert_Is_Equal_To(1)
    (1).random_String().assert_Size_Is(1)


