require('../../src/fluentnode')

describe '| node-native | crypo',->
  value = "abc123"

  it 'add_Random_Chars', ->
    using value,->
      @.add_Random_Chars(1)  .size().assert_Is    value.size().add 1
      @.add_Random_Chars()   .size().assert_Above value.size().add 5
      @.add_Random_Chars(100).size().assert_Above value.size().add 80 # the chars size is less than 101 (I think is due to weird ascii values)


  it 'add_Random_String', ->
    using value,->
      @.add_Random_String()   .size().assert_Is value.size().add 10
      @.add_Random_String(1)  .size().assert_Is value.size().add 1
      @.add_Random_String(100).size().assert_Is value.size().add 100


  it 'add_Random_Letters', ->
      value.add_Random_Letters(5)  .size().assert_Is value.size().add 5
      randomLetters = "".add_Random_Letters(5)
      charSet_Numbers = '0123456789'
      charSet_Letters = 'abcdefghijklmnopqrstuvwxyz'
      for char in randomLetters
          (-> charSet_Numbers.assert_Contains(char)).assert_Throws()
          (-> charSet_Letters.assert_Contains(char)).assert_Not_Throws()

  it 'add_5_Random_Letters', ->
      value.add_5_Random_Letters().size().assert_Is value.size().add 5
      value.add_5_Letters().size().assert_Is value.size().add 5
      ''.add_5_Random_Letters.assert_Is ''.add_5_Letters

  it 'add_Random_Numbers', ->
      value.add_Random_Numbers(5  ).size().assert_Is value.size() + 5
      ""   .add_Random_Numbers(500).size().assert_Is 500
      randomNumbers = "".add_Random_Numbers(5)
      charSet_Numbers = '0123456789'
      charSet_Letters = 'abcdefghijklmnopqrstuvwxyz'
      for char in randomNumbers
          (-> charSet_Numbers.assert_Contains(char)).assert_Not_Throws()
          (-> charSet_Letters.assert_Contains(char)).assert_Throws()

  it 'checksum', ()->
    '1234' .checksum().assert_Is_Not '12345'.checksum()
    '1234' .checksum().assert_Is '81dc9bdb52d04dc20036dbd8313ed055'
    'admin'.checksum().assert_Is '21232f297a57a5a743894a0e4a801fc3'
    '1234' .checksum('sha1').assert_Is '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'
    'admin'.checksum('sha1').assert_Is 'd033e22ae348aeb5660fc2140aec35850c4da997'
    '1234' .checksum('sha256').assert_Is '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    'admin'.checksum('sha256').assert_Is '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'
    '1234' .checksum('sha512').assert_Is 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'
    'admin'.checksum('sha512').assert_Is 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec'

    (()-> 'admin'.checksum('aaa')).assert_Throws((error)-> error.message.assert_Is 'Digest method not supported')


  it 'random_Chars',->
    size = 10
    chars = (size).random_Chars()
    count = 0
    for i in [0...size]
      chars.charCodeAt(i+5)
      count++
    count.assert_Is size

  it 'random_String',->
    (0).random_String().size().assert_Is_Equal_To(10)
    (1).random_String().size().assert_Is_Equal_To(1)
    (1).random_String().assert_Size_Is(1)

  it 'random_Letters',->
    (10).random_Letters().size().assert_Is_Equal_To(10)
