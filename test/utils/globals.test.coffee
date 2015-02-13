require('../../src/fluentnode')

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

  it 'file_Exists', ->
    file_Exists('.gitignore').assert_True()
    file_Exists('.abc'      ).assert_False()
    file_Exists(null        ).assert_False()
    file_Exists(undefined   ).assert_False()
    file_Exists({}.notHere  ).assert_False()

  it 'is_Number',->
    is_Number(0   ).assert_True()
    is_Number(-1  ).assert_True()
    is_Number(9999).assert_True()
    is_Number(NaN ).assert_False()
    is_Number(''  ).assert_False()
    is_Number('ab').assert_False()
    is_Number(null).assert_False()

  it 'is_Null',->
    is_Null(null     ).assert_True()
    is_Null(undefined).assert_False()
    is_Null(''       ).assert_False()
    is_Null(0        ).assert_False()

  it 'log',->
    log.assert_Is(console.log)

  it 'not_Null',->
    not_Null.assert_Is(existy)

  it 'using',->
    target = { a:'abc', b: 42}
    using.assert_Is_Function()
    is_Null(@.a)
    is_Null(@.b)
    using target,->
      @.a.assert_Is('abc')
      @.b.assert_Is(42)

  it 'truthly',->
    truthly(null     ).assert_False()
    truthly(false    ).assert_False()
    truthly(undefined).assert_False()
    truthly(0        ).assert_True()
    truthly(1        ).assert_True()
    truthly(''       ).assert_True()
    truthly(' '      ).assert_True()
    truthly(true     ).assert_True()