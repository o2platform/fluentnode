require('../src/fluent-assert')

describe.only 'fluent-assert',->

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


  describe 'String', ->
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