require('../src/fluent-assert')

describe 'fluent-assert',->
  describe 'Array',->
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

  describe 'Boolean',->
    it 'assert_Is_True', ->
      true.assert_Is_True.assert_Is_Function()
      true.assert_Is_True().assert_Is_True()
      (-> false.assert_Is_True()).assert_Throws()

    it 'assert_Is_False', ->
      true.assert_Is_False.assert_Is_Function()
      false.assert_Is_False().assert_Is_False()
      (-> true.assert_Is_False()).assert_Throws()

  describe 'Function', ->
    it 'assert_Throws', ->
      (-> throws 'fail')  .assert_Throws()
      try
        (-> 42 == 42)     .assert_Throws()
        throw 'fail'
      catch error
        (error == 'fail') .assert_Is_False()

    it 'assert_Not_Throws', ->
      (-> 42 == 42)       .assert_Not_Throws()
      try
        (-> throws 'fail').assert_Not_Throws()
        throw 'fail'
      catch error
        (error == 'fail') .assert_Is_False()

    it 'assert_Is_Function', ->
      (->).assert_Is_Function()
      (->).assert_Is_Function.assert_Is_Function()

  describe 'Number', ->
    it 'assert_Is_Equal_To',->
      it 'assert_Is_Equal_To', ->
      (0).assert_Is_Equal_To.assert_Is_Function()
      (0).assert_Is_Equal_To(0)
      (-> (0).assert_Is_Equal_To(0)).assert_Not_Throws()
      (-> (0).assert_Is_Equal_To(1)).assert_Throws()

  describe 'Object', ->
    it 'assert_Is_Equal_To', ->
      ''.assert_Is_Equal_To.assert_Is_Function()
      '{}'.assert_Is_Equal_To('{}')
      {}.assert_Is_Equal_To({})
      {'a'}.assert_Is_Equal_To({'a'})
      '12'.assert_Is_Equal_To('12')
      (-> '12'.assert_Is_Equal_To('12')).assert_Not_Throws()
      (-> '12'.assert_Is_Equal_To('42')).assert_Throws()

    it 'assert_Is_Not_Equal_To', ->
      ''.assert_Is_Not_Equal_To.assert_Is_Function()
      '{}'.assert_Is_Not_Equal_To('12')
      '12'.assert_Is_Not_Equal_To('42')
      {'a'}.assert_Is_Not_Equal_To({'b'})
      (-> '12'.assert_Is_Not_Equal_To('42')).assert_Not_Throws()
      (-> '12'.assert_Is_Not_Equal_To('12')).assert_Throws()

    it 'assert_Is_Object', ->
      {}.assert_Is_Object.assert_Is_Function()
      {}.assert_Is_Object().assert_Is_Equal_To({})

  describe 'String', ->
    it 'assert_Contains', ->
      ''.assert_Contains.assert_Is_Function()
      ''.assert_Contains(''          ).assert_Is_Equal_To('')
      '123'.assert_Contains('1'      ).assert_Is_Equal_To('123')
      '123'.assert_Contains('123'    ).assert_Is_Equal_To('123')
      (->'123'.assert_Contains('1'  )).assert_Not_Throws()
      (->'123'.assert_Contains('0'  )).assert_Throws()

    it 'assert_Not_Contains', ->
      ''.assert_Not_Contains.assert_Is_Function()
      ''.assert_Not_Contains('a'         ).assert_Is_Equal_To('')
      '123'.assert_Not_Contains('a'      ).assert_Is_Equal_To('123')
      '123'.assert_Not_Contains('aaa'    ).assert_Is_Equal_To('123')
      (->'123'.assert_Not_Contains('a'  )).assert_Not_Throws()
      (->'123'.assert_Not_Contains('2'  )).assert_Throws()

    it 'assert_Is_Equal_To', ->
      ''.assert_Is_Equal_To.assert_Is_Function()
      'a'.assert_Is_Equal_To('a')
      (-> 'a'.assert_Is_Equal_To('a')).assert_Not_Throws()
      (-> 'a'.assert_Is_Equal_To('b')).assert_Throws()

    it 'assert_Is_Json', ->
      ''.assert_Is_Json.assert_Is_Function()
      '{}'.assert_Is_Json().assert_Is_Equal_To({})
      '{"a":"b"}'.assert_Is_Json().assert_Is_Equal_To({a: 'b'})

    it 'assert_Is_String', ->
      ''.assert_Is_String.assert_Is_Function()
      'aa'.assert_Is_String()
      #this is a bug
      ''.assert_Is_String().assert_Is_Equal_To({})

    it 'assert_Length_Is', ->
      "".assert_Length_Is.assert_Is_Function()
      "".assert_Length_Is.assert_Is_Equal_To("".assert_Size_Is)
      "".assert_Length_Is(0).assert_Is_Equal_To("")
      "a".assert_Length_Is(1).assert_Is_Equal_To("a")
      "ab".assert_Length_Is(2).assert_Is_Equal_To("ab")
      (->"a".assert_Length_Is(1)).assert_Not_Throws()
      (->"a".assert_Length_Is(2)).assert_Throws()

    it 'assert_Length_Is_Not', ->
      "".assert_Length_Is_Not.assert_Is_Function()
      "".assert_Length_Is_Not.assert_Is_Equal_To("".assert_Size_Is_Not)
      "".assert_Length_Is_Not(1).assert_Is_Equal_To("")
      "a".assert_Length_Is_Not(2).assert_Is_Equal_To("a")
      "ab".assert_Length_Is_Not(3).assert_Is_Equal_To("ab")
      (->"a".assert_Length_Is_Not(2)).assert_Not_Throws()
      (->"a".assert_Length_Is_Not(1)).assert_Throws()

    it 'assert_That_File_Exists',->
      ''.assert_That_File_Exists.assert_Is_Function()
      '.gitignore'.assert_That_File_Exists().assert_Is_Equal_To('.gitignore')
      (->'.gitignore'.assert_That_File_Exists()).assert_Not_Throws()
      (->'.aaaaaaaaa'.assert_That_File_Exists()).assert_Throws()

    it 'assert_That_File_Not_Exists',->
      ''.assert_That_File_Not_Exists.assert_Is_Function()
      'aaaaaaaa'.assert_That_File_Not_Exists().assert_Is_Equal_To('aaaaaaaa')
      (->'.aaaaaaaa'.assert_That_File_Not_Exists()).assert_Not_Throws()
      (->'.gitignore'.assert_That_File_Not_Exists()).assert_Throws()

    it 'assert_That_Folder_Exists',->
      ''.assert_That_Folder_Exists.assert_Is_Function()
      '.git'.assert_That_Folder_Exists().assert_Is_Equal_To('.git')
      (-> '.git'.assert_That_Folder_Exists()).assert_Not_Throws()
      (-> '.aaa'.assert_That_Folder_Exists()).assert_Throws()

    it 'assert_That_Folder_Not_Exists',->
      ''.assert_That_Folder_Not_Exists.assert_Is_Function()
      'aaaaaaaa'.assert_That_Folder_Not_Exists().assert_Is_Equal_To('aaaaaaaa')
      (-> '.aaa'.assert_That_Folder_Not_Exists()).assert_Not_Throws()
      (-> '.git'.assert_That_Folder_Not_Exists()).assert_Throws()