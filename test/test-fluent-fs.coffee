require('../src/fluent-path')
require('../src/fluent-fs')
expect     = require('chai').expect

describe 'fluent-fs',->

  it 'folder_Create and folder_Delete' , ->
    tmpDir = "./".temp_Name_In_Folder()
    expect(tmpDir.folder_Exists()).to.be.false
    expect(tmpDir.folder_Create()).to.equal(tmpDir.realPath())
    expect(tmpDir.folder_Exists()).to.be.true
    expect(tmpDir.folder_Delete()).to.be.true
    expect(tmpDir.folder_Exists()).to.be.false

  it 'folder_Delete_Recursive' , ->
    tmpDir = "./"   .temp_Name_In_Folder().folder_Create()
    tmpFile = tmpDir.temp_Name_In_Folder().file_Create()
    expect(tmpDir.folder_Delete_Recursive()).to.be.true

  it 'file_Create and file_Delete',->
    tmpName = '.'.temp_Name_In_Folder()
    expect(tmpName.file_Create()).to.equal(tmpName)
    expect(tmpName.exists()     ).to.be.true
    expect(tmpName.file_Delete()).to.be.true
    expect(tmpName.exists()     ).to.be.false

  it 'file_Exists' , ->
    expect(''.file_Exists).to.be.an('function')
    expect('.git'      .file_Exists()).to.be.true
    expect('./index.js'.file_Exists()).to.be.true
    expect('./aaa.js'  .file_Exists()).to.be.false

  it 'file_Not_Exists' , ->
    expect(''.file_Not_Exists).to.be.an('function')
    expect('.git'      .file_Not_Exists()).to.be.false
    expect('./index.js'.file_Not_Exists()).to.be.false
    expect('./aaa.js'  .file_Not_Exists()).to.be.true

  it 'files' , ->
    expect(''.files).to.be.an('function')
    files = './'.files().filter (file) -> file isnt '.DS_Store'
    expect(files).to.be.an('Array')
    expectedFiles = '.git,.gitignore,.travis.yml,LICENSE,README.md,index.js,node_modules,package.json,src,test'.split(',')
    expect(files).to.deep.equal(expectedFiles)

  it 'is_Folder', ->
    expect(''.is_Folder).to.be.an('function')
    expect('.git'      .is_Folder()).to.be.true
    expect('.gitignore'.is_Folder()).to.be.false
    expect('.gitAAA'   .is_Folder()).to.be.false

  it 'is_File', ->
    expect(''.is_Folder).to.be.an('function')
    expect('.git'      .is_File()).to.be.false
    expect('.gitignore'.is_File()).to.be.true
    expect('.gitAAA'   .is_File()).to.be.false

  it 'realPath', ->
    expect(''.realPath).to.be.an('function')
    expect('.git'        .realPath()).to.equal(process.cwd().path_Combine('.git'      ))
    expect('.gitignore'  .realPath()).to.equal(process.cwd().path_Combine('.gitignore'))
    expect('.gitignore2' .realPath()).to.equal(null)

  it 'temp_Name_In_Folder', ->
    tmpName = './'.temp_Name_In_Folder()
    expect(tmpName       ).to.contain('./'.realPath())
    expect(tmpName       ).to.contain('_tmp_')
    expect(tmpName.size()).to.equal('./'.realPath().size()+16)

  it 'touch',->
    expect(''.touch).to.be.an('function')
    tempFile = '.'.temp_Name_In_Folder().touch()
    expect(tempFile.file_Exists()).to.be.true
    expect(tempFile.file_Delete()).to.be.true

  it 'exists'       , -> expect('.git'.exists       ).to.equal(".git".file_Exists)
  it 'create_Dir'   , -> expect('.git'.create_Dir   ).to.equal(".git".folder_Create)
  it 'folder_Exists', -> expect('.git'.folder_Exists).to.equal(".git".is_Folder)
  it 'is_Directory' , -> expect('.git'.is_Directory ).to.equal(".git".is_Folder)
        