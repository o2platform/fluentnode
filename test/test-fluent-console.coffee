require('../src/fluent-console')
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
        console.log('direct log msg')
        'msg using extension method'.console_log()
        expect(log_Messages).to.deep.equal([ 'direct log msg', 'msg using extension method' ])
        
    it 'log', ->
        expect("".log).to.be.an('Function')
        "log using .log()".log()
        expect(log_Messages).to.deep.equal([ "log using .log()"])