require('../src/globals')

describe 'global',->

  it 'existy',->
    existy(null      ).assert_False()
    existy(undefined ).assert_False()
    existy({}.notHere).assert_False()
    existy((()->)()  ).assert_False() # same as existy((function(){})())
    existy(@         ).assert_True()
    existy(0         ).assert_True()
    existy(true      ).assert_True()
    existy(false     ).assert_True()

  it 'truthly',->
    truthly(null     ).assert_False()
    truthly(false    ).assert_False()
    truthly(undefined).assert_False()
    truthly(0        ).assert_True()
    truthly(1        ).assert_True()
    truthly(''       ).assert_True()
    truthly(' '      ).assert_True()
    truthly(true     ).assert_True()