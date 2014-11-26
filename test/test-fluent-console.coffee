require('../src/fluent-console')
require('../src/fluent-array')
expect     = require('chai').expect

describe 'fluent-console',->
    
    original_log = null
    log_Messages = null
    
    beforeEach ->
        original_log = console.log
        log_Messages = []
        console.log  = (logMsg)-> log_Messages.push(logMsg)
        
    afterEach ->
        console.log = original_log
        
    it 'console_log', ->
        expect("".console_log).to.be.an('Function')
        console.log  ('direct log msg')
        returnValue = 'msg using extension method'.console_log()
        
        expect(log_Messages).to.deep.equal([ 'direct log msg', 'msg using extension method' ])
        expect(returnValue ).to.equal('msg using extension method')
        
    it '{string}.log', ->
        expect("".log).to.be.an('Function')
        "log using .log()".log()
        expect(log_Messages).to.deep.equal([ "log using .log()"])
    
    it '{array}.log', ->
        expect([].log).to.be.an('Function')
        target = ['1','3',5,'abc']
        target.log().assert_Is(target)
        log_Messages.assert_Is(['1,3,5,abc'])        
        
        
    #it '_log', ->
    #    expect("".log).to.be.an('Function')
    #    expect(log_Messages).to.deep.equal([ "log using ._log()"])    