require('../src/String')
expect = require('chai').expect

describe 'String',->
    value = "abc123"

    it 'append', ->
        expect(value.append).to.be.an('Function')
        expect(value.append(        )).to.equal(value)
        expect(value.append(''      )).to.equal(value)
        expect(value.append(null    )).to.equal(value)
        expect(value.append('a'     )).to.equal(value + 'a')
        expect(value.append('abc'   )).to.equal(value + 'abc')
        expect(value.append('abc123')).to.equal(value + 'abc123')

    it 'add_Random_Chars', ->
        expect(value.add_Random_Chars            ).to.be.an   ('Function')
        expect(value.add_Random_Chars(1)  .size()).to.equal   (value.size() + 1 )
        expect(value.add_Random_Chars()   .size()).to.be.above(value.size() + 5 )
        expect(value.add_Random_Chars(100).size()).to.be.above(value.size() + 80) # the chars size is less than 101 (I think is due to weird ascii values

    it 'add_Random_String', ->
        expect(value.add_Random_String            ).to.be.an   ('Function')
        expect(value.add_Random_String()   .size()).to.equal   (value.size() + 10 )
        expect(value.add_Random_String(1)  .size()).to.equal   (value.size() + 1  )
        expect(value.add_Random_String(100).size()).to.equal   (value.size() + 100)

    it 'add_Random_Letters', ->
        expect(value.add_Random_Letters            ).to.be.an ('Function')
        expect(value.add_Random_Letters(5)  .size()).to.equal  (value.size() + 5 )
        randomLetters = "".add_Random_Letters(5);
        charSet_Numbers = '0123456789'
        charSet_Letters = 'abcdefghijklmnopqrstuvwxyz'
        for char in randomLetters
            (-> charSet_Numbers.assert_Contains(char)).assert_Throws()
            (-> charSet_Letters.assert_Contains(char)).assert_Not_Throws()

    it 'add_5_Random_Letters', ->
        expect(value.add_5_Random_Letters            ).to.be.an ('Function')
        expect(value.add_5_Random_Letters()  .size()).to.equal  (value.size() + 5 )

    it 'add_Random_Numbers', ->
        expect(value.add_Random_Numbers            ).to.be.an ('Function')
        expect(value.add_Random_Numbers(5)  .size()).to.equal  (value.size() + 5 )
        expect(""   .add_Random_Numbers(500)  .size()).to.equal  (500 )
        randomNumbers = "".add_Random_Numbers(5);
        charSet_Numbers = '0123456789'
        charSet_Letters = 'abcdefghijklmnopqrstuvwxyz'
        for char in randomNumbers
            (-> charSet_Numbers.assert_Contains(char)).assert_Not_Throws()
            (-> charSet_Letters.assert_Contains(char)).assert_Throws()

    it 'after',->
        value.after.assert_Is_Function()
        value.after('3'  ).assert_Is(''      )
        value.after('2'  ).assert_Is('3'     )
        value.after('123').assert_Is(''      )
        value.after('b'  ).assert_Is('c123'  )
        value.after('bc1').assert_Is('23'    )
        value.after('xxx').assert_Is(''      )
        value.after(null ).assert_Is(''      )
        value.after(''   ).assert_Is('abc123')
        'abb'.after('b'  ).assert_Is('b'     )
        'a.b'.after('.'  ).assert_Is('b'     )
        'a.b.c'.after('.').assert_Is('b.c'   )


    it 'after_Last',->
        value.after_Last.assert_Is_Function()
        value.after_Last('3'  ).assert_Is(''     )
        value.after_Last('2'  ).assert_Is('3'    )
        value.after_Last('123').assert_Is(''     )
        value.after_Last('b'  ).assert_Is('c123' )
        value.after_Last('bc1').assert_Is('23'   )
        value.after_Last('xxx').assert_Is(''     )
        value.after_Last(null ).assert_Is(''     )
        value.after_Last(''   ).assert_Is(''     )
        'abb'.after_Last('b'  ).assert_Is(''     )
        'a.b'.after_Last('.'  ).assert_Is('b'    )
        'a.b.c'.after_Last('.').assert_Is('c'    )

    it 'before',->
        value.before.assert_Is_Function()
        value.before('3'  ).assert_Is('abc12')
        value.before('2'  ).assert_Is('abc1' )
        value.before('123').assert_Is('abc'  )
        value.before('b'  ).assert_Is('a'    )
        value.before('bc1').assert_Is('a'    )
        value.before('xxx').assert_Is(''     )
        value.before(''   ).assert_Is(''     )
        value.before(null ).assert_Is(''     )
        'abb'.before('b'  ).assert_Is('a'    )
        'a.b'.before('.'  ).assert_Is('a'    )
        'a.b.c'.before('.').assert_Is('a'    )


    it 'before_Last',->
        value.before_Last.assert_Is_Function()
        value.before_Last('3'  ).assert_Is('abc12' )
        value.before_Last('2'  ).assert_Is('abc1'  )
        value.before_Last('123').assert_Is('abc'   )
        value.before_Last('b'  ).assert_Is('a'     )
        value.before_Last('bc1').assert_Is('a'     )
        value.before_Last('xxx').assert_Is(''      )
        value.before_Last(null ).assert_Is(''      )
        value.before_Last(''   ).assert_Is('abc123')
        'abb'.before_Last('b'  ).assert_Is('ab'    )
        'a.b'.before_Last('.'  ).assert_Is('a'     )
        'a.b.c'.before_Last('.').assert_Is('a.b'   )

    it 'contains',->
        value.contains.assert_Is_Function()
        value.contains('3'         ).assert_Is_True()
        value.contains('2'         ).assert_Is_True()
        value.contains('123'       ).assert_Is_True()
        value.contains(value       ).assert_Is_True()
        value.contains(value + '1' ).assert_Is_False()
        value.contains('1' + value ).assert_Is_False()

        value.contains(['1']       ).assert_Is_True()
        value.contains(['1','2']   ).assert_Is_True()
        value.contains(['1','abc1']).assert_Is_True()
        value.contains(['d','abc1']).assert_Is_False()

        value.contains(/a.c/ ).assert_Is_True()
        value.contains(/1.3/ ).assert_Is_True()
        value.contains(/a.*3/).assert_Is_True()
        value.contains(/ab.1/).assert_Is_True()
        value.contains(/ac.2/).assert_Is_False()


    it 'ends_With',->
      using value, ->
        @.ends_With.assert_Is_Function()
        @.ends_With('3'         ).assert_Is_True()
        @.ends_With('2'         ).assert_Is_False()
        @.ends_With('123'       ).assert_Is_True()
        @.ends_With(value       ).assert_Is_True()
        @.ends_With(value + '1' ).assert_Is_False()
        @.ends_With('1' + value ).assert_Is_False()
        @.ends_With(''          ).assert_Is_False()
        @.ends_With(null        ).assert_Is_False()
        @.ends_With(undefined   ).assert_Is_False()
        @.assert_Is(value)

    it 'lower', ->
        expect(value.lower).to.be.an('Function')
        expect(value.lower()        ).to.equal(value.toLowerCase())
        expect(value.lower().upper()).to.equal(value.toUpperCase())

    it 'not_Contains',->
        value.not_Contains.assert_Is_Function()
        value.not_Contains('3'         ).assert_Is_False()
        value.not_Contains('2'         ).assert_Is_False()
        value.not_Contains('123'       ).assert_Is_False()
        value.not_Contains(value       ).assert_Is_False()
        value.not_Contains(value + '1' ).assert_Is_True()
        value.not_Contains('1' + value ).assert_Is_True()

    it 'remove', ->
      using value,->
        @.remove('a'  ).assert_Is 'bc123'
        @.remove('b'  ).assert_Is 'ac123'
        @.remove('abc').assert_Is '123'
        @.remove('123').assert_Is 'abc'
        (@+@).remove('a'   ).assert_Is 'bc123'.twice()
        (@+@).remove('bc12').assert_Is 'a3'   .twice()

    it 'size', ->
        expect(value.size).to.be.an('Function')
        expect(''.size()                 ).to.equal(0)
        expect(value.size()              ).to.equal(6)
        expect(value.append('abc').size()).to.equal(9)

    it 'starts_With',->
      using value,->
        @.starts_With.assert_Is_Function()
        @.starts_With('a'     ).assert_Is_True()
        @.starts_With('b'     ).assert_Is_False()
        @.starts_With('abc'   ).assert_Is_True()
        @.starts_With(value   ).assert_Is_True()
        @.starts_With(@ + 'a' ).assert_Is_False()
        @.starts_With( 'a' + @).assert_Is_False()
        @.starts_With(''      ).assert_Is_False()
        @.assert_Is(@)

    it 'trim', ->
        value.trim.assert_Is_Function()
        value.trim().assert_Is    (value)
        'a 1'.trim().assert_Is    ('a 1')
        'a1 '.trim().assert_Is    ('a1' )
        ' 1 '.trim().assert_Is    ('1'  )
        '   '.trim().assert_Is    (''  )
        'a1 '.trim().assert_Is_Not('a 1')
        ' 1 '.trim().assert_Is_Not('a 1')
        '   '.trim().assert_Is_Not('a 1')

    it 'twice', ->
      using value,->
        @  .twice().assert_Is @ + @
        'a'.twice().assert_Is 'aa'
        '' .twice().assert_Is ''


    it 'json_Parse',->
      '{ "a" : 42 }'.json_Parse().assert_Is { a : '42' }
      "{}"         .json_Parse({})
      (-> ''.json_Parse()).assert_Throws (error)->
          error.message.assert_Is 'Unexpected end of input'

      #console.log  '{ }'.json_Parse()
      # {}""          .json_Parse().assert_Is { }
