require('../../src/fluentnode')

describe 'crypo |',->
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

   it 'random_String',->
    (0).random_String().size().assert_Is_Equal_To(10)
    (1).random_String().size().assert_Is_Equal_To(1)
    (1).random_String().assert_Size_Is(1)

   it 'random_Letters',->
    (10).random_Letters().size().assert_Is_Equal_To(10)
