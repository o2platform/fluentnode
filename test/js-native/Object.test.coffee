require('../../src/fluentnode')

expect     = require('chai').expect


describe 'Object',->

    o = {}          # recursive json object (should not stringify ok)
    o.o = o

    it 'str',->
        ""     .str().assert_Is ""
        "123"  .str().assert_Is "123"
        []     .str().assert_Is [].toString()
        {}     .str().assert_Is {}.toString()
        {a:'1'}.str().assert_Is "[object Object]"

    it 'json_Str',->
        ""   .json_Str().assert_Is "\"\""
        "123".json_Str().assert_Is "\"123\""
        {}   .json_Str().assert_Is "{}"
        {a:1}.json_Str().assert_Is "{\"a\":1}"
        o    .json_Str().assert_Is ''

    it 'json_Pretty', ->
        {a:1}        .json_Pretty().assert_Is '{\n  \"a\": 1\n}'
        [{a:1},{b:1}].json_Pretty().assert_Is '[\n  {\n    \"a\": 1\n  },\n  {\n    \"b\": 1\n  }\n]'
        {a:1}        .json_Pretty().assert_Is '{\n  \"a\": 1\n}'
        {null:null}  .json_Pretty().assert_Is '{\n  "null": null\n}'
        o            .json_Pretty().assert_Is ''

        {}.json_pretty.assert_Is {}.json_Pretty

    it 'json_inspect',->
        a = null
        {null:null}.json_Inspect().assert_Is '{ null: null }'
        o          .json_Inspect().assert_Is "{ o: [Circular] }"
        o          .json_inspect().assert_Is "{ o: [Circular] }"

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

    it 'values', ->
        abc = { key1:'aaa', key2:'bbb'}
        abc.values().assert_Is_Equal_To(['aaa', 'bbb'])

    it 'call_Function',()->
        check_Call_Param = (source, param1, param2)->
            source.assert_Is_Equal_To({'a'})
            param1 .assert_Is_Equal_To('b')
            param2 .assert_Is_Equal_To('c')
            'd'
        {'a'}.call_Function.assert_Is_Function()
        {'a'}.call_Function(check_Call_Param, 'b', 'c').assert_Is('d')

    it 'save_Json , load_Json', ->
        target = '__tmp_'.add_5_Random_Letters().append_To_Process_Cwd_Path()
        source = { a: '123', b: '42'}
        target.assert_File_Not_Exists()
        source.save_Json(target)
        target.assert_File_Exists()
        target.load_Json().assert_Is source
        'aaaa'.save_As target
        target.load_Json().assert_Is {}
        target.file_Delete().assert_True()



    it 'repl_Me',(done)->
        anObject = {a : 'an value' , b :2}
        anObject.repl_Me.assert_Is_Function()

        replMe = anObject.repl_Me done
        replMe.assert_Is_Object()
        replMe.context.that.assert_Is(anObject)
        replMe.rli.close()
        "".log()                    # without this extra line here, coveralls fails to publish
