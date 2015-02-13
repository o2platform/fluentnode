require('../../src/fluentnode')

expect = require('chai').expect

describe 'String',->
  value = "abc123"

  it 'append', ->
    using value,->
      @.append(        ).assert_Is(value)
      @.append(''      ).assert_Is(value)
      @.append(null    ).assert_Is(value)
      @.append('a'     ).assert_Is(value + 'a')
      @.append('abc'   ).assert_Is(value + 'abc')
      @.append('abc123').assert_Is(value + 'abc123')

      @.append.assert_Is @.add

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

  it 'is', ->
    'a'.is('a').assert_True()
    'a'.is('b').assert_False()
    'b'.is('a').assert_False()
    '' .is('' ).assert_True()
    '' .is('a').assert_False()

  it 'isnt, is_Not', ->
    'a'.is_Not('a').assert_False()
    'a'.is_Not('b').assert_True()
    'b'.is_Not('a').assert_True()
    '' .is_Not('' ).assert_False()
    '' .is_Not('a').assert_True()
    '' .is_Not.assert_Is ''.isnt

  it 'lines', ->
    "abcdefgf".lines().assert_Is ['abcdefgf']
    "a\nd\ngf".lines().assert_Is ['a','d','gf']
    "a\r\n_gf".lines().assert_Is ['a','_gf']
    "a\n\r_gf".lines().assert_Is ['a','','_gf']
    "a\u2028f".lines().assert_Is ['a','f']
    "a\u2029f".lines().assert_Is ['a','f']
    ""        .lines().assert_Is ['']

    "\r\n\n\r\u2028\u2029".lines().assert_Is ['','','','','','']
    "1\r\n2\n3\r4\u20285\u20296".lines().assert_Is ['1','2','3','4','5','6']

    ''.lines.assert_Is ''.split_Lines

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

  it 'only_Letters', ->
    'aaa'.only_Letters().assert_Is 'aaa'
    'aAa'.only_Letters().assert_Is 'aAa'
    'aaa'.only_Letters().assert_Is_Not 'bbb'
    'a 1'.only_Letters().assert_Is 'a--'
    'A!"'.only_Letters().assert_Is 'A--'
    '/<>'.only_Letters().assert_Is '---'
    'abcd-ABCD_1234.<h1>*!@{}[]'.only_Letters().assert_Is 'abcd-ABCD-------h---------'
    '!@£$%^&*(){}:"|<>?[];\'\,/'.only_Letters().assert_Is '-'.repeat(24)

  it 'only_Numbers', ->
    '1aa'.only_Numbers().assert_Is '1--'
    '2Aa'.only_Numbers().assert_Is '2--'
    '123'.only_Numbers().assert_Is '123'
    'aaa'.only_Numbers().assert_Is_Not 'bbb'
    '1  '.only_Numbers().assert_Is '1--'
    'A1"'.only_Numbers().assert_Is '-1-'
    '/<>'.only_Numbers().assert_Is '---'
    'abcd-ABCD_1234.<h1>*!@{}[]'.only_Numbers().assert_Is '----------1234---1--------'
    '!@£$%^&*(){}:"|<>?[];\'\,/'.only_Numbers().assert_Is '-'.repeat(24)

  it 'remove', ->
    using value,->
      @.remove('a'  ).assert_Is 'bc123'
      @.remove('b'  ).assert_Is 'ac123'
      @.remove('abc').assert_Is '123'
      @.remove('123').assert_Is 'abc'
      (@+@).remove('a'   ).assert_Is 'bc123'.twice()
      (@+@).remove('bc12').assert_Is 'a3'   .twice()

  it 'repeat', ->
    'a' .repeat(0).assert_Is ''
    'a' .repeat(1).assert_Is 'a'
    'a' .repeat(2).assert_Is 'aa'
    'a' .repeat(5).assert_Is 'aaaaa'
    'ab'.repeat(5).assert_Is 'ababababab'

    ''  .repeat(5   ).assert_Is ''
    'a' .repeat('a' ).assert_Is ''
    'a' .repeat(null).assert_Is ''

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

  it 'to_Safe_String', ->
    'aaa'.to_Safe_String().assert_Is 'aaa'
    'aaa'.to_Safe_String().assert_Is_Not 'bbb'
    'a  '.to_Safe_String().assert_Is 'a--'
    'a!"'.to_Safe_String().assert_Is 'a--'
    '/<>'.to_Safe_String().assert_Is '---'
    'abcd-ABCD_1234.<h1>*!@{}[]'.to_Safe_String().assert_Is 'abcd-abcd_1234.-h1--------'
    '!@£$%^&*(){}:"|<>?[];\'\,/'.to_Safe_String().assert_Is '-'.repeat(24)

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
    "{}"          .json_Parse().assert_Is {}
    ''            .json_Parse().assert_Is {}
    'aaaa'        .json_Parse().assert_Is {}
    '{a:12}'      .json_Parse().assert_Is {}


  it 'json_Valid',->
    '{ "a" : 42 }'.json_Valid().assert_True
    "{}"          .json_Valid().assert_True
    ''            .json_Valid().assert_False
    'aaaa'        .json_Valid().assert_False
    '{a:12}'      .json_Valid().assert_False