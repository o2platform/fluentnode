require('../../src/fluentnode')

expect     = require('chai').expect

describe 'Boolean',->

  it 'is_True',->
    expect(true.is_True    ).to.be.an('Function')
    expect(false.is_True   ).to.be.an('Function')
    expect(true.is_True()  ).to.be.true
    expect(false.is_True() ).to.be.false
    expect((1==1).is_True()).to.be.true
    expect((1==2).is_True()).to.be.false
    expect((1!=1).is_True()).to.be.false

  it 'is_False',->
    expect(true.is_False    ).to.be.an('Function')
    expect(false.is_False   ).to.be.an('Function')
    expect(true.is_False()  ).to.be.false
    expect(false.is_False() ).to.be.true
    expect((1==1).is_False()).to.be.false
    expect((1==2).is_False()).to.be.true
    expect((1!=1).is_False()).to.be.true