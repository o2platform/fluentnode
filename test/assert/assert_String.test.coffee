require('../../src/fluentnode')

describe '| Assert | String', ->
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
    tmp_File = '.'.temp_File('aaa123').assert_File_Contains('aaa')
                                      .assert_File_Contains('123')
                                      .assert_File_Contains('aaa123')


    '.'.assert_File_Contains.assert_Is ''.assert_File_Contents_Contains

    (-> tmp_File.assert_File_Contains('-----****----')).assert_Throws (error)->
      error.message.assert_Contains  "to contain '-----****----'"
    (-> './aaaaaa.json'.assert_File_Contains('-----****----')).assert_Throws (error)->
      error.message.assert_Is  "Cannot read property 'assert_Contains' of null"
    tmp_File.assert_File_Deleted()

  it 'assert_File_Contents', ->
    '.'.temp_File('aaa123').assert_File_Contents('aaa123')
                           .assert_File_Deleted()

    (-> './aaaaa.json'.assert_File_Contents('-----****----')).assert_Throws (error)->
      error.message.assert_Is  "Cannot read property 'assert_Is' of null"

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
    tmp_File = 'aa'.save_As('_tmp_File')
    tmp_File.assert_That_File_Exists().assert_Is_Equal_To('_tmp_File'.real_Path())
    (-> tmp_File.assert_That_File_Exists()).assert_Not_Throws()
    (->'.aaaaaaaaa'.assert_That_File_Exists()).assert_Throws()
    tmp_File.assert_File_Deleted()

  it 'assert_That_File_Not_Exists',->
    ''.assert_That_File_Not_Exists.assert_Is_Function()
    'aaaaaaaa'.assert_That_File_Not_Exists().assert_Is_Equal_To('aaaaaaaa')
    (->'.aaaaaaaa'.assert_That_File_Not_Exists()).assert_Not_Throws()

    tmp_File = 'aa'.save_As('_tmp_File')                           # create file
    (->tmp_File.assert_That_File_Not_Exists()).assert_Throws()     # confirm assert_That_File_Not_Exists throws
    tmp_File.assert_File_Deleted()                                 # delete file
    tmp_File.assert_That_File_Not_Exists()                         # confirm assert_That_File_Not_Exists not throws

  it 'assert_That_Folder_Exists',->
    ''.assert_That_Folder_Exists.assert_Is_Function()
    '_tmp_Folder'.folder_Create()
    '_tmp_Folder'.assert_That_Folder_Exists().assert_Is_Equal_To('_tmp_Folder')
    '_tmp_Folder'.folder_Delete()
    '_tmp_Folder'.assert_That_Folder_Not_Exists().assert_Is_Equal_To('_tmp_Folder')
    (-> '.aaa'.assert_That_Folder_Exists()).assert_Throws()
    (-> 'aaa'.assert_Is_Folder()).assert_Throws (error)->
      error.message.assert_Is 'Expected aaa to exist'

    ''.assert_That_Folder_Exists.assert_Is ''.assert_Is_Folder

  it 'assert_That_Folder_Not_Exists',->
    ''.assert_That_Folder_Not_Exists.assert_Is_Function()
    'aaaaaaaa'.assert_That_Folder_Not_Exists().assert_Is_Equal_To('aaaaaaaa')
    (-> '.aaa'.assert_That_Folder_Not_Exists()).assert_Not_Throws()
    '_tmp_Folder'.folder_Create()
    (-> '_tmp_Folder'.assert_That_Folder_Not_Exists()).assert_Throws()
    '_tmp_Folder'.folder_Delete()