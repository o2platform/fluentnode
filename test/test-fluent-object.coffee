require('../src/fluent-object')
require('../src/fluent-console')
expect     = require('chai').expect

describe 'fluent-object',->
    
    it 'str',->
        expect(""    .str).to.be.an('Function')
        expect(""    .str()).to.equal(""   .toString() )
        expect("123" .str()).to.equal("123".toString() )
        expect([]    .str()).to.equal([]   .toString() )
        expect({}    .str()).to.equal({}   .toString() )
        expect({a:'1'}.str()).to.equal("[object Object]")
    
#    it 'json',->
#        expect(""   .json).to.be.an('Function')
#        expect(""   .json()).to.equal("\"\"")
#        expect("123".json()).to.equal("\"123\"")
#        expect({}   .json()).to.equal("{}")
#        expect({a:1}.json()).to.equal("{\"a\":1}")
    
    it 'json_pretty', ->
        expect({a:1}        .json_pretty()).to.equal('{\n  \"a\": 1\n}')
        expect([{a:1},{b:1}].json_pretty()).to.equal('[\n  {\n    \"a\": 1\n  },\n  {\n    \"b\": 1\n  }\n]')
    
    it 'json_inspect',->
        expect(""   .json_inspect).to.be.an('Function')
        o = {}
        o.o = o
        expect(o.json_inspect()).to.equal("{ o: [Circular] }")

    it 'keys', ->
        abc = { key1:'', key2:''}
        abc.keys().assert_Is_Equal_To(['key1', 'key2'])

    it 'keys_All', ->
        class abc
            constructor:->
                @key1 = ''
                @key2 = ''
            key1_All:->
            key2_All:->

        new abc().keys()    .assert_Is_Equal_To(['key1', 'key2'])
        new abc().keys_All().assert_Is_Equal_To(['key1', 'key2', 'key1_All', 'key2_All'])

    it 'call_Function',()->
        check_Call_Param = (source, param1, param2)->
            source.assert_Is_Equal_To({'a'})
            param1 .assert_Is_Equal_To('b')
            param2 .assert_Is_Equal_To('c')
            'd'
        {'a'}.call_Function.assert_Is_Function()
        {'a'}.call_Function(check_Call_Param, 'b', 'c').assert_Is('d')