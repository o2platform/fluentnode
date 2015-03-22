require('../../src/fluentnode')

describe 'Assert | String |', ->
  it 'assert_Contains', ->
    ''.assert_Contains.assert_Is_Function()
    ''.assert_Contains(''          ).assert_Is_Equal_To('')
    '123'.assert_Contains('1'      ).assert_Is_Equal_To('123')
    '123'.assert_Contains('123'    ).assert_Is_Equal_To('123')
    '123'.assert_Contains(['1']    ).assert_Is_Equal_To('123')
    '123'.assert_Contains(['1','2']).assert_Is_Equal_To('123')
    (->'123'.assert_Contains('1'  )).assert_Not_Throws()
    (->'123'.assert_Contains('0'  )).assert_Throws()
    (->'123'.assert_Contains(['0'])).assert_Throws()

  it 'assert_Empty', ->
    (->''.assert_Empty()).assert_Not_Throws()
    (->'123'.assert_Empty()).assert_Throws (error)->
      error.message.assert_Is 'Expected empty string but it was 123'


  it 'assert_Not_Contains', ->
    ''.assert_Not_Contains.assert_Is_Function()
    ''.assert_Not_Contains('a'         ).assert_Is_Equal_To('')
    '123'.assert_Not_Contains('a'      ).assert_Is_Equal_To('123')
    '123'.assert_Not_Contains('aaa'    ).assert_Is_Equal_To('123')
    (->'123'.assert_Not_Contains('a'  )).assert_Not_Throws()
    (->'123'.assert_Not_Contains('2'  )).assert_Throws()

  it 'assert_File_Contains', ->
    '.'.temp_File('aaa123').assert_File_Contains('aaa')
                           .assert_File_Contains('123')
                           .assert_File_Contains('aaa123')
                           .assert_File_Deleted()

    '.'.assert_File_Contains.assert_Is ''.assert_File_Contents_Contains


    (-> './package.json'.assert_File_Contains('-----****----')).assert_Throws (error)->
      error.message.assert_Contains  "to contain '-----****----'"

  it 'assert_File_Contents', ->
    '.'.temp_File('aaa123').assert_File_Contents('aaa123')
                           .assert_File_Deleted()

    (-> './package.json'.assert_File_Contents('-----****----')).assert_Throws (error)->
      error.message.assert_Contains  "to be '-----****----'"

  it 'assert_Is_Equal_To', ->
    ''.assert_Is_Equal_To.assert_Is_Function()
    'a'.assert_Is_Equal_To('a')
    (-> 'a'.assert_Is_Equal_To('a')).assert_Not_Throws()
    (-> 'a'.assert_Is_Equal_To('b')).assert_Throws()

  it 'assert_Is_Json', ->
    ''.assert_Is_Json.assert_Is_Function()
    '{}'.assert_Is_Json().assert_Is_Equal_To({})
    '{"a":"b"}'.assert_Is_Json().assert_Is_Equal_To({a: 'b'})
    (-> '{}'     .assert_Is_Json()).assert_Not_Throws()
    (-> 'aaa.aaa'.assert_Is_Json()).assert_Throws()

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

  it 'assert_Not_Empty', ->
    (->'123'.assert_Not_Empty()).assert_Not_Throws()
    (->''.assert_Not_Empty()).assert_Throws (error)->
      error.message.assert_Is "Expected non empty string but it was ''"

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
    (-> 'aaa'.assert_Is_Folder()).assert_Throws (error)->
      error.message.assert_Is 'Expected aaa to exist'

    ''.assert_That_Folder_Exists.assert_Is ''.assert_Is_Folder

  it 'assert_That_Folder_Not_Exists',->
    ''.assert_That_Folder_Not_Exists.assert_Is_Function()
    'aaaaaaaa'.assert_That_Folder_Not_Exists().assert_Is_Equal_To('aaaaaaaa')
    (-> '.aaa'.assert_That_Folder_Not_Exists()).assert_Not_Throws()
    (-> '.git'.assert_That_Folder_Not_Exists()).assert_Throws()