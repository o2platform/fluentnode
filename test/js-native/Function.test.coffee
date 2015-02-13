require('../../src/fluentnode')

class Abc
  constructor: ->
    @value = 'abc'
    @aaaaa = 'abc'

  getValue: ->
    @value

  getValue_Inside_Abc: =>
    @value


describe 'Function',->

  it 'ctor',->
    Abc.assert_Is_Function().ctor().assert_Is_Object()
                            .value.assert_Is('abc')
    Abc.ctor().str().assert_Is(new Abc().str())
    Abc.ctor().value.assert_Is_Not('def')
    ((new Abc()).keys_All()).assert_Contains('getValue')

  it 'invoke',->
    Abc.ctor().getValue.assert_Is_Function()
    abc = new Abc()
    (abc.getValue()                   != undefined).assert_Is_True()
    (abc.getValue.invoke()            == undefined).assert_Is_True()
    (abc.getValue_Inside_Abc()        != undefined).assert_Is_True()
    (abc.getValue_Inside_Abc.invoke() != undefined).assert_Is_True()
    abc.getValue_Inside_Abc.invoke().assert_Is('abc')
    abc.getValue_Inside_Abc.invoke().assert_Is(new Abc() .value)
    abc.getValue_Inside_Abc.invoke().assert_Is(Abc.ctor().value)

  #we could make this test better by adding a check for measuring that the timeout amount is correct
  it 'invoke_In', (done)->
    done.invoke_In.assert_Is_Function()
    done.invoke_In(0)

  it 'source_Code', () ->
    test = ()-> return 12
    test.assert_Is_Function()
    test.source_Code.assert_Is_Function()
    test.source_Code().assert_Is("function () {\n        return 12;\n      }")
    test.source_Code.assert_Is test.sourceCode    
