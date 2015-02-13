require('../../src/fluentnode')

assert = require 'assert'

describe 'Assert | Array |',->

  it 'assert_Is_Array', ->
    [].assert_Is_Array.assert_Is_Function()
    [].assert_Is_Array().assert_Is_Equal_To({})
    [].assert_Is_Array().assert_Is_Equal_To([])
    [].assert_Is_Array().assert_Is_Not_Equal_To(['a'])

  it 'assert_Size_Is', ->
    [       ].assert_Size_Is.  assert_Is_Function()
    [       ].assert_Size_Is(0).assert_Is_Equal_To([      ])
    ['a'    ].assert_Size_Is(1).assert_Is_Equal_To(['a'   ])
    ['a','b'].assert_Size_Is(2).assert_Is_Equal_To(['a','b'])

  it 'assert_Size_Is_Bigger_Than',->
    [       ].assert_Size_Is_Bigger_Than.  assert_Is_Function()
    [       ].assert_Size_Is_Bigger_Than(-1).assert_Is_Equal_To([      ])
    [''     ].assert_Size_Is_Bigger_Than(0).assert_Is_Equal_To([''    ])
    ['a'    ].assert_Size_Is_Bigger_Than(0).assert_Is_Equal_To(['a'   ])
    ['a','b'].assert_Size_Is_Bigger_Than(1).assert_Is_Equal_To(['a','b'])
    (-> ['' ].assert_Size_Is_Bigger_Than(-1)).assert_Not_Throws()
    (-> ['' ].assert_Size_Is_Bigger_Than(1)).assert_Throws()

    using [].assert_Size_Is_Bigger_Than, ->
      @.assert_Is [].assert_Size_Is_Greater_Than
      @.assert_Is [].assert_Size_Is_Above
      @.assert_Is [].assert_Is_Greater_Than
      @.assert_Is [].assert_Is_Bigger_Than
      @.assert_Is [].assert_Greater_Than
      @.assert_Is [].assert_Bigger_Than


  it 'assert_Size_Is_Not', ->
    [       ].assert_Size_Is_Not.  assert_Is_Function()
    [       ].assert_Size_Is_Not(1).assert_Is_Equal_To([      ])
    ['a'    ].assert_Size_Is_Not(2).assert_Is_Equal_To(['a'   ])
    ['a','b'].assert_Size_Is_Not(3,).assert_Is_Equal_To(['a','b'])

  it 'assert_Contains', ->
    [       ].assert_Contains.  assert_Is_Function()
    ['a'    ].assert_Contains('a').assert_Is_Equal_To(['a'   ])
    ['a','b'].assert_Contains('b').assert_Is_Equal_To(['a','b'])
    (-> ['a'].assert_Contains('')).assert_Throws()

  it 'assert_Not_Contains', ->
    [       ].assert_Not_Contains.assert_Is_Function()
    ['a'    ].assert_Not_Contains('1').assert_Is_Equal_To(['a'   ])
    ['a','b'].assert_Not_Contains('2').assert_Is_Equal_To(['a','b'])
    (-> ['' ].assert_Not_Contains('')).assert_Throws()

  it 'assert_Empty', ->
    [].assert_Empty          .assert_Is_Function()
    [].assert_Empty()        .assert_Is_Equal_To([])
    (-> ['a'].assert_Empty()).assert_Throws()

  it 'assert_Not_Empty', ->
    [    ].assert_Not_Empty.  assert_Is_Function()
    ['ab'].assert_Not_Empty().assert_Is_Equal_To(['ab'])
    (-> [].assert_Not_Empty()).assert_Throws()
