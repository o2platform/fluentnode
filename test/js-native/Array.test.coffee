#back to [main](fluent.html)

require('../../src/fluentnode')

expect     = require('chai').expect

describe '| js-native | Array',->
  it 'add',->
    [       ].add.assert_Is_Function()
    [       ].add( 'a'     ).assert_Is(['a'])
    ['a'    ].add( 'b'     ).assert_Is(['a','b'])
    ['a'    ].add( 'b','c' ).assert_Is(['a','b','c'])
    ['a','b'].add( 'c','d' ).assert_Is(['a','b','c','d'])
    ['1','1'].add( 1,2,3,4 ).assert_Is(['1','1',1,2,3,4])

    a = []
    a.add('1')
    a.assert_Is(['1'])
    a.add('2','3')
    a.assert_Is(['1','2','3'])
    a.add(4).add(5,6)
    a.assert_Is(['1','2','3',4, 5, 6])

    [].add( null,    ).assert_Is([null])
      .add( undefined).assert_Is([null,undefined            ])
      .add( 1        ).assert_Is([null,undefined,1          ])
      .add( 'a'      ).assert_Is([null,undefined,1,'a'      ])
      .add( [1,2]    ).assert_Is([null,undefined,1,'a',[1,2]])

  it 'contains',->
    [].contains.assert_Is_Function()
    [            ].contains(   ).assert_Is_False()
    [            ].contains('' ).assert_Is_False()
    [''          ].contains('' ).assert_Is_True()
    [''          ].contains(   ).assert_Is_False()
    ['1'         ].contains('1').assert_Is_True()
    ['1'         ].contains('2').assert_Is_False()
    ['1','2'     ].contains('1').assert_Is_True()
    ['1','2'     ].contains('2').assert_Is_True()
    ['1','2'     ].contains('3').assert_Is_False()

    ['1','2'     ].contains(['5'    ]).assert_Is_False()
    ['1','2'     ].contains(['5','1']).assert_Is_False()
    ['1','2'     ].contains(['1'    ]).assert_Is_True()
    ['1','2'     ].contains(['2'    ]).assert_Is_True()
    ['1','2'     ].contains(['1','1']).assert_Is_True()
    ['1','2'     ].contains(['2','1']).assert_Is_True()

  it 'empty',->
    expect([            ].empty).to.be.an('Function')
    expect([            ].empty()).to.be.true
    expect([''          ].empty()).to.be.false
    expect([null        ].empty()).to.be.false

  it 'first',->
    expect([            ].first).to.be.an('Function')
    expect([            ].first()).to.equal(null)
    expect([''          ].first()).to.equal('')
    expect(['123'       ].first()).to.equal('123')
    expect(['123', 'abc'].first()).to.equal('123')
    expect([null, 'abc' ].first()).to.equal(null)

  it 'fourth',->
    expect([               ].fourth).to.be.an('Function')
    expect([               ].fourth()).to.equal(null)
    expect(['1','2','3','4'].fourth()).to.equal('4')

  it 'item',->
    [0,1].item(0).assert_Is(0)
    [0,1].item(1).assert_Is(1)
    assert_Is_Null([0,1].item(2))
    assert_Is_Null([0,1].item(-1))
    assert_Is_Null([0,1].item(9999))
    assert_Is_Null([0,1].item(null))
    assert_Is_Null([0,1].item(false))

  it 'last', ->
    expect([            ].last).to.be.an('Function')
    expect([            ].last()).to.equal(null)
    expect([''          ].last()).to.equal('')
    expect(['123'       ].last()).to.equal('123')
    expect(['123', 'abc'].last()).to.equal('abc')
    expect(['123', null ].last()).to.equal(null)

  it 'not_Contains',->
    [].not_Contains.assert_Is_Function()
    [            ].not_Contains(   ).assert_Is_True()
    [            ].not_Contains('' ).assert_Is_True()
    [''          ].not_Contains('' ).assert_Is_False()
    [''          ].not_Contains(   ).assert_Is_True()
    ['1'         ].not_Contains('1').assert_Is_False()
    ['1'         ].not_Contains('2').assert_Is_True()
    ['1','2'     ].not_Contains('1').assert_Is_False()
    ['1','2'     ].not_Contains('2').assert_Is_False()
    ['1','2'     ].not_Contains('3').assert_Is_True()

  it 'not_Empty',->
    [            ].not_Empty.assert_Is_Function()
    [            ].not_Empty().assert_Is_False()
    [''          ].not_Empty().assert_Is_True()
    [null        ].not_Empty().assert_Is_True()

  it 'log', ->
    # see '{array}.log" test in test-fluent-console

  it 'nth',->
    [].nth.assert_Is([].item)

  it 'remove_At',->
    [0,1,2,3,4].remove_At(0).assert_Is [1,2,3,4]
    [0,1,2,3,4].remove_At(1).assert_Is [0,2,3,4]
    [0,1,2,3,4].remove_At(2).assert_Is [0,1,3,4]
    [0,1,2,3,4].remove_At(4).assert_Is [0,1,2,3]

  it 'remove_First',->
    [0,1,2,3,4].remove_First().assert_Is [1,2,3,4]
    [1,2,3,4  ].remove_First().assert_Is [2,3,4  ]
    [2,3,4    ].remove_First().assert_Is [3,4    ]
    [3,4      ].remove_First().assert_Is [4      ]

  it 'second',->
    expect([            ].second).to.be.an('Function')
    expect([            ].second()).to.equal(null)
    expect([''          ].second()).to.equal(null)
    expect(['123'       ].second()).to.equal(null)
    expect(['123', 'abc'].second()).to.equal('abc')
    expect(['123', null ].second()).to.equal(null)

  it 'size',->
    expect([            ].size).to.be.an('Function')
    expect([            ].size()).to.equal(0)
    expect([''          ].size()).to.equal(1)
    expect(['123'       ].size()).to.equal(1)
    expect(['123', 'abc'].size()).to.equal(2)
    expect(['123', null ].size()).to.equal(2)

  it 'starts_With', ->
    [            ].starts_With.assert_Is_Function()
    [            ].starts_With(   ).assert_Is_Equal_To([        ])
    [''          ].starts_With('' ).assert_Is_Equal_To([        ])
    [' '         ].starts_With(' ').assert_Is_Equal_To([' '     ])
    ['1','23','2'].starts_With('1').assert_Is_Equal_To(['1'     ])
    ['1','23','2'].starts_With('2').assert_Is_Equal_To(['23','2'])
    ['1','23','2'].starts_With('4').assert_Is_Equal_To([        ])

  it 'third' ,->
    expect([               ].third).to.be.an('Function')
    expect([               ].third()).to.equal(null)
    expect(['1','2','3','4'].third()).to.equal('3')

  it 'take', ->
    [            ].take.assert_Is_Function()
    [            ].take( ).assert_Is_Equal_To([        ])
    [''          ].take(0).assert_Is_Equal_To([        ])
    [' '         ].take(1).assert_Is_Equal_To([' '     ])
    ['1','23','2'].take(1).assert_Is_Equal_To(['1'     ])
    ['1','23','2'].take(2).assert_Is_Equal_To(['1','23'])
    ['1','23','2'].take(0).assert_Is_Equal_To([        ])

  it 'unique', ->
    [            ].unique.assert_Is_Function()
    [            ].unique().assert_Is_Equal_To([])
    [''          ].unique().assert_Is_Equal_To([''])
    ['1'         ].unique().assert_Is_Equal_To(['1'])
    ['1','2'     ].unique().assert_Is_Equal_To(['1','2'])
    ['1','1'     ].unique().assert_Is_Equal_To(['1'])
    ['1','2','1' ].unique().assert_Is_Equal_To(['1','2'])
