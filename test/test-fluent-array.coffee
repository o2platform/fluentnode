require('../src/fluent-array')
expect     = require('chai').expect

describe 'fluent-array',->
    
    it 'empty',->
        expect([            ].empty).to.be.an('Function')        
        expect([            ].empty()).to.be.true
        expect([''          ].empty()).to.be.false
        expect([null        ].empty()).to.be.false
        
    it 'first',->
        expect([            ].first).to.be.an('Function')
        expect([            ].first()).to.equal(null)
        expect([''          ].first()).to.equal('')
        expect(['123'       ].first()).to.equal('123')
        expect(['123', 'abc'].first()).to.equal('123')
        expect([null, 'abc' ].first()).to.equal(null)
        
    it 'second',->
        expect([            ].second).to.be.an('Function')
        expect([            ].second()).to.equal(null)
        expect([''          ].second()).to.equal(null)
        expect(['123'       ].second()).to.equal(null)
        expect(['123', 'abc'].second()).to.equal('abc')
        expect(['123', null ].second()).to.equal(null)
        
    it 'third' ,->
        expect([               ].third).to.be.an('Function')
        expect([               ].third()).to.equal(null)
        expect(['1','2','3','4'].third()).to.equal('3')
        
    it 'fourth',->
        expect([               ].fourth).to.be.an('Function')
        expect([               ].fourth()).to.equal(null)
        expect(['1','2','3','4'].fourth()).to.equal('4')
        
    it 'size',->
        expect([            ].size).to.be.an('Function')
        expect([            ].size()).to.equal(0)
        expect([''          ].size()).to.equal(1)
        expect(['123'       ].size()).to.equal(1)
        expect(['123', 'abc'].size()).to.equal(2)
        expect(['123', null ].size()).to.equal(2)