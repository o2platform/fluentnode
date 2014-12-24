#back to [main](fluent.html)


require('../src/Array')

expect     = require('chai').expect

describe 'Array',->
    
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
        
    it 'second',->
        expect([            ].second).to.be.an('Function')
        expect([            ].second()).to.equal(null)
        expect([''          ].second()).to.equal(null)
        expect(['123'       ].second()).to.equal(null)
        expect(['123', 'abc'].second()).to.equal('abc')
        expect(['123', null ].second()).to.equal(null)
        
    it 'third' ,->
        expect([               ].third).to.be.an('Function')
        expect([               ].third()).to.equal(null)
        expect(['1','2','3','4'].third()).to.equal('3')
        
    it 'fourth',->
        expect([               ].fourth).to.be.an('Function')
        expect([               ].fourth()).to.equal(null)
        expect(['1','2','3','4'].fourth()).to.equal('4')

    it 'last', ->
        expect([            ].last).to.be.an('Function')
        expect([            ].last()).to.equal(null)
        expect([''          ].last()).to.equal('')
        expect(['123'       ].last()).to.equal('123')
        expect(['123', 'abc'].last()).to.equal('abc')
        expect(['123', null ].last()).to.equal(null)
    
    #it 'log', ->  # see '{array}.log" test in test-fluent-console
        
    it 'size',->
        expect([            ].size).to.be.an('Function')
        expect([            ].size()).to.equal(0)
        expect([''          ].size()).to.equal(1)
        expect(['123'       ].size()).to.equal(1)
        expect(['123', 'abc'].size()).to.equal(2)
        expect(['123', null ].size()).to.equal(2)

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

    it 'unique', ->
        [            ].unique.assert_Is_Function()
        [            ].unique().assert_Is_Equal_To([])
        [''          ].unique().assert_Is_Equal_To([''])
        ['1'         ].unique().assert_Is_Equal_To(['1'])
        ['1','2'     ].unique().assert_Is_Equal_To(['1','2'])
        ['1','1'     ].unique().assert_Is_Equal_To(['1'])
        ['1','2','1' ].unique().assert_Is_Equal_To(['1','2'])
    it 'starts_With', ->
        [            ].starts_With.assert_Is_Function()
        [            ].starts_With(   ).assert_Is_Equal_To([        ])
        [''          ].starts_With('' ).assert_Is_Equal_To([        ])
        [' '         ].starts_With(' ').assert_Is_Equal_To([' '     ])
        ['1','23','2'].starts_With('1').assert_Is_Equal_To(['1'     ])
        ['1','23','2'].starts_With('2').assert_Is_Equal_To(['23','2'])
        ['1','23','2'].starts_With('4').assert_Is_Equal_To([        ])
    it 'take', ->
        [            ].take.assert_Is_Function()
        [            ].take( ).assert_Is_Equal_To([        ])
        [''          ].take(0).assert_Is_Equal_To([        ])
        [' '         ].take(1).assert_Is_Equal_To([' '     ])
        ['1','23','2'].take(1).assert_Is_Equal_To(['1'     ])
        ['1','23','2'].take(2).assert_Is_Equal_To(['1','23'])
        ['1','23','2'].take(0).assert_Is_Equal_To([        ])