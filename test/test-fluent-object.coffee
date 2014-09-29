require('../src/fluent-object')
require('../src/fluent-console')
expect     = require('chai').expect

describe 'fluent-object',->
    
    it 'str',->
        expect(""   .str).to.be.an('Function')
        expect(""   .str()).to.equal(""   .toString() )
        expect("123".str()).to.equal("123".toString() )
        expect([]   .str()).to.equal([]   .toString() )
        expect({}   .str()).to.equal({}   .toString() )
        expect({a:1}.str()).to.equal("[object Object]")
    
    it 'json',->
        expect(""   .json).to.be.an('Function')
        expect(""   .json()).to.equal("\"\"")
        expect("123".json()).to.equal("\"123\"")
        expect({}   .json()).to.equal("{}")
        expect({a:1}.json()).to.equal("{\"a\":1}")
    
    it 'json_inspect',->
        expect(""   .json_inspect).to.be.an('Function')
        o = {}
        o.o = o
        expect(o.json_inspect()).to.equal("{ o: [Circular] }")