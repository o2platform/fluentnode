require('../../src/fluentnode')

describe 'Assert | Object |', ->
  it 'assert_Is_Equal_To, assert_Is', ->
    ''.assert_Is_Equal_To.assert_Is_Function()
    '{}'.assert_Is_Equal_To('{}')
    {}.assert_Is_Equal_To({})
    {'a'}.assert_Is_Equal_To({'a'})
    '12'.assert_Is_Equal_To('12')
    (-> '12'.assert_Is('12')).assert_Not_Throws()
    (-> '12'.assert_Is('42')).assert_Throws()

  it 'assert_Is_Instance_Of, assert_Instance_Of', ->
    ''.assert_Is_Instance_Of.assert_Is_Function()
    ''.assert_Is_Instance_Of(String)
    (12).assert_Is_Instance_Of(Number)
    (new Error()).assert_Is_Instance_Of(Error)
    (-> '12'.assert_Instance_Of(String)).assert_Not_Throws()
    (-> '12'.assert_Instance_Of(Number)).assert_Throws()

  it 'assert_Is_Not_Equal_To, assert_Is_Not', ->
    ''.assert_Is_Not_Equal_To.assert_Is_Function()
    '{}'.assert_Is_Not_Equal_To('12')
    '12'.assert_Is_Not_Equal_To('42')
    {'a'}.assert_Is_Not_Equal_To({'b'})
    (-> '12'.assert_Is_Not('42')).assert_Not_Throws()
    (-> '12'.assert_Is_Not('12')).assert_Throws()

  it 'assert_Is_Null', ->
    assert_Is_Null.assert_Is_Function();
    assert_Is_Null(null)
    (-> assert_Is_Null(null)).assert_Not_Throws()
    (-> assert_Is_Null('123')).assert_Throws()

  it 'assert_Is_Not_Null', ->
    assert_Is_Not_Null.assert_Is_Function();
    assert_Is_Not_Null('123')
    (-> assert_Is_Not_Null('123')).assert_Not_Throws()
    (-> assert_Is_Not_Null(null)).assert_Throws()

  it 'assert_Is_Object', ->
    {}.assert_Is_Object.assert_Is_Function()
    {}.assert_Is_Object().assert_Is_Equal_To({})

  it 'assert_Is_Undefined', ->
    assert_Is_Undefined.assert_Is_Function();
    assert_Is_Undefined(undefined)
    aaaa = undefined
    assert_Is_Undefined(aaaa)
    (-> assert_Is_Undefined(undefined)).assert_Not_Throws()
    (-> assert_Is_Undefined('123')).assert_Throws()

  it 'assert_Is_Not_Undefined', ->
    assert_Is_Not_Undefined.assert_Is_Function();
    assert_Is_Not_Undefined('123')
    (-> assert_Is_Not_Undefined('123')).assert_Not_Throws()
    (-> assert_Is_Not_Undefined(undefined)).assert_Throws()