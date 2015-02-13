require('../../src/fluentnode')

describe 'Number',->

  it 'add', ->
    (1 ).add().assert_Is(1 )
    (-1).add().assert_Is(-1)
    (10).add().assert_Is(10)

    (1 ).add(0).assert_Is(1)
    (1 ).add(4).assert_Is(5)
    (10).add(-1).assert_Is(9)
    (10).add(-9).assert_Is(1)

    original = 1
    using original,->
      @.add( ).assert_Is @
      @.assert_Is 1
      @.add(9).assert_Is @ + 9
      @.assert_Is 1

  it 'dec', ->
    (1 ).dec().assert_Is(0 )
    (-1).dec().assert_Is(-2)
    (10).dec().assert_Is( 9)

    (1 ).dec(0).assert_Is(1)
    (1 ).dec(4).assert_Is(-3)
    (10).dec(-1).assert_Is(11)
    (10).dec(-9).assert_Is(19)

    original = 1
    using original,->
      @.dec( ).assert_Is @ - 1
      @.assert_Is 1
      @.dec(9).assert_Is @ - 9
      @.assert_Is 1

  it 'in_Between', ->
    (10).in_Between( 5,15).assert_True()
    (10).in_Between(-5,15).assert_True()
    (10).in_Between(10,15).assert_False()
    (10).in_Between( 5,10).assert_False()
    (10).in_Between(11,10).assert_False()
    (10).in_Between(11,20).assert_False()
    (10).in_Between( 5,-5).assert_False()

  it 'inc', ->
    (1 ).inc().assert_Is(2 )
    (-1).inc().assert_Is(0 )
    (10).inc().assert_Is(11)

    (1 ).inc(0).assert_Is(1)
    (1 ).inc(4).assert_Is(5)
    (10).inc(-1).assert_Is(9)
    (10).inc(-9).assert_Is(1)

    original = 1
    using original,->
      @.inc( ).assert_Is @ + 1
      @.assert_Is 1
      @.inc(9).assert_Is @ + 9
      @.assert_Is 1

  it 'is_Number',->
    (0).is_Number().assert_True()
    NaN.is_Number().assert_False()
    (-> 'a'.is_Number()).assert_Throws (error)->
      error.message.assert_Is "Object a has no method 'is_Number'"

  it 'invoke_After', (done)->
    (0).invoke_After(done)

  it 'random', ->
    10   .random().assert_In_Between(-1,10)
    100  .random().assert_In_Between(-1,100)
    1000 .random().assert_In_Between(-1,1000)
    10000.random().assert_In_Between(-1,10000)

  it 'str',->
    (0).str.assert_Is_Function()
    (0).str().assert_Is('0')
    (9).str().assert_Is('9')

