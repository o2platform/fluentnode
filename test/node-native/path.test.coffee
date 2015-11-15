
require('../../src/fluentnode')

expect  = require('chai').expect
path    = require('path')

describe '| path',->

  it 'path_Combine', ->
    expect("".path_Combine  ).to.be.an('function')
    expect("".path_Combine()).to.be.an('string')

    expect(""   .path_Combine()).to.equal('')
    expect("abc".path_Combine()).to.equal('abc')
    expect("abc".path_Combine('def')).to.equal("abc#{path.sep}def")

  it 'path_Combine , file_Parent_Folder', ->
    ''.file_Dir_Name.assert_Is_Function()
    '.'.fullPath().path_Combine('aaaa')
                 .file_Dir_Name().assert_Is(".".fullPath())
    '/abc/def/123.txt'.file_Parent_Folder().assert_Is('/abc/def')

  it 'append_To_Process_Cwd_Path', ->
    expect(""           .append_To_Process_Cwd_Path  ).to.be.an('function')
    expect(""           .append_To_Process_Cwd_Path()).to.equal(process.cwd())
    expect("abc"        .append_To_Process_Cwd_Path()).to.equal(process.cwd() + "#{path.sep}abc"        )
    expect("abc.txt"    .append_To_Process_Cwd_Path()).to.equal(process.cwd() + "#{path.sep}abc.txt"    )
    expect("abc/aaa.txt".append_To_Process_Cwd_Path()).to.equal(process.cwd() + "#{path.sep}abc#{path.sep}aaa.txt")

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

  it 'folder_Name', ->
    temp_Dir = '_temp_Dir_'.add_5_Letters().folder_Create()
    temp_Dir.assert_Folder_Exists()
            .folder_Name()
            .assert_Contains '_temp_Dir_'
    temp_Dir.folder_Delete().assert_Is_True()
