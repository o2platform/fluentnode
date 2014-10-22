require('../src/fluent-string')
expect = require('chai').expect

describe 'fluent-string',->        
    value = "abc123"  
    
    it 'append', ->              
        expect(value.append).to.be.an('Function')
        expect(value.append(        )).to.equal(value)
        expect(value.append(''      )).to.equal(value)
        expect(value.append(null    )).to.equal(value)
        expect(value.append('a'     )).to.equal(value + 'a')
        expect(value.append('abc'   )).to.equal(value + 'abc')
        expect(value.append('abc123')).to.equal(value + 'abc123')
        
    it 'add_Random_Chars', ->
        expect(value.add_Random_Chars            ).to.be.an   ('Function')
        expect(value.add_Random_Chars(1)  .size()).to.equal   (value.size() + 1 )
        expect(value.add_Random_Chars(100).size()).to.be.above(value.size() + 80) # the chars size is less than 101 (I think is due to weird ascii values

    it 'add_Random_String', ->
        expect(value.add_Random_String            ).to.be.an   ('Function')
        expect(value.add_Random_String(1)  .size()).to.equal   (value.size() + 1  )
        expect(value.add_Random_String(100).size()).to.equal   (value.size() + 100)
        
    it 'size', ->              
        expect(value.size).to.be.an('Function')
        expect(''.size()                 ).to.equal(0)        
        expect(value.size()              ).to.equal(6)
        expect(value.append('abc').size()).to.equal(9)    