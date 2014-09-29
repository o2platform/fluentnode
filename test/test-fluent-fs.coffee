require('../src/fluent-fs')
expect     = require('chai').expect

describe 'fluent-fs',->
    
    it 'fileExists' , ->
        expect('.git'      .fileExists()).to.be.true;
        expect('./index.js'.fileExists()).to.be.true;
        expect('./aaa.js'  .fileExists()).to.be.false;
        
    it 'files' , ->
        files = './'.files()
        expectedFiles = '.git,.gitignore,.travis.yml,LICENSE,README.md,index.js,node_modules,package.json,src,test'.split(',')
        
        expect(files).to.deep.equal(expectedFiles)