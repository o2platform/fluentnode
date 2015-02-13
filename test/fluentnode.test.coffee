require('../src/fluentnode')

describe '| fluentnode.test',->
  it '/utils/*',->

    #/utils/globals
    global.existy .assert_Is_Function()
    global.is_Null.assert_Is_Function()
    global.log    .assert_Is_Function()

    #/utils/encoding
    ''.url_Encode.assert_Is_Function()

  it '/assert/*',->
    #/assert/assert_Array
    [].empty .assert_Is_Function()

  #to-do add one test for each file/require

