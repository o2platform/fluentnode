#require('../src/fluent-path')
FluentPath = require('../src/fluent-path')
path       = require('path')
expect     = require('chai').expect

describe 'fluent-path',->
    it 'fluentpath',->
        expect("".fluentpath  ).to.be.an('Function')
        expect("".fluentpath()).to.be.an('String')
        expect("".fluentpath()).to.equal('FluentPath is here, see https://github.com/o2platform/FluentNode for more details')
        
    it 'FluentPath ctor', ->
        stringValue = "abc123"
        fluentPath  = new FluentPath(stringValue)
        expect(FluentPath).to.be.an('Function')
        expect(fluentPath).to.be.an('Object')
        expect(fluentPath.string).to.be.an('String')
        expect(fluentPath.string).to.equal(stringValue)
    
    it 'toString',->
        stringValue = "abc123"
        fluentPath  = new FluentPath(stringValue)
        expect(fluentPath.toString  ).to.be.an('Function')
        expect(fluentPath.toString()).to.equal(stringValue)
        expect(stringValue.path.toString  ).to.be.an('Function')
        expect(stringValue.path.toString()).to.equal(stringValue)
        
    it 'join',->
        expect("".path       ).to.be.an('Object')
        expect("".path.join  ).to.be.an('Function')
        expect("".path.join("a")).to.be.an('String')
        
        
        items = [ { left: 'aaa' , right: 'bbb'  , result : 'aaa/bbb'}
                  { left: '/aaa', right: '/bbb' , result: '/aaa/bbb'}
                  { left: '/a/b', right: '/ccc' , result: '/a/b/ccc'}
                  { left: 'a/b' , right: null   , result: 'a/b'}]
        
        for item in items
            if  item.right
                expect(item.result).to.equal(path.join(item.left,item.right), "result value is wrong: #{item}")
            fluent_join   = item.left.path.join(item.right)
            direct_Join   = new FluentPath(item.left).join(item.right)
            expect(fluent_join).to.equal(item.result , "fluent join didn't match for" + JSON.stringify(item))
            expect(direct_Join).to.equal(item.result , "direct join didn't match for" + JSON.stringify(item))
    
    it 'path_Combine', ->
        expect("".path_Combine  ).to.be.an('function')
        expect("".path_Combine()).to.be.an('string')
        
        expect(""   .path_Combine()).to.equal('')
        expect("abc".path_Combine()).to.equal('abc')
        expect("abc".path_Combine('def')).to.equal('abc/def')

    it 'file_Extension', ->
        expect("".file_Extension  ).to.be.an('function')
        expect("".file_Extension()).to.be.an('string')

        expect("index.html"    .file_Extension()).to.equal('.html')
        expect("index.abc.html".file_Extension()).to.equal('.html')
        expect("index."        .file_Extension()).to.equal('.')
        expect("index"         .file_Extension()).to.equal('')

    it 'file_Name', ->
        expect(''        .file_Name  ).to.be.an('function')
        expect(''        .file_Name()).to.equal('')
        expect('/a/b'    .file_Name()).to.equal('b')
        expect('/a/b/c'  .file_Name()).to.equal('c')
        expect('/a/b.txt'.file_Name()).to.equal('b.txt')

    it 'file_Name_Without_Extension', ->
        expect(''        .file_Name_Without_Extension  ).to.be.an('function')
        expect(''        .file_Name_Without_Extension()).to.equal(''  )
        expect('/a/b'    .file_Name_Without_Extension()).to.equal('b' )
        expect('/a/b..c' .file_Name_Without_Extension()).to.equal('b.')
        expect('/a/b.txt'.file_Name_Without_Extension()).to.equal('b' )

    it 'file_Names', ->
        source = ['/a/b','/a/b/', '/a/b/c', '/a/d/f.txt']
        result = ['b'   ,'b'    , 'c'     , 'f.txt'     ]
        expect(source.file_Names  ).to.be.an('function')
        expect(source.file_Names()).to.deep.equal(result)

    it 'file_Names_Without_Extension', ->
        source = ['/a/b','/a/b/', '/a/b/c', '/a/d/f.txt']
        result = ['b'   ,'b'    , 'c'     , 'f'     ]
        expect(source.file_Names_Without_Extension  ).to.be.an('function')
        expect(source.file_Names_Without_Extension()).to.deep.equal(result)
