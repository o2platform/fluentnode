#back to [main](fluent.html)
require('../src/assert/Array')
require('../src/String')
require('../src/path')
require('../src/fs')
expect     = require('chai').expect

describe 'fs',->

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

  it 'file_Contents' , ->
    expect(''.file_Contents).to.be.an('function')
    file_Name     = '_temp_name_'.add_Random_String(5)
    file_Contents = 'value_'.add_Random_String(5)
    expect(file_Name.file_Exists()).to.be.false
    file_Contents.saveAs(file_Name)
    expect(file_Name.file_Exists()).to.be.true
    expect(file_Name.file_Contents()).to.equal(file_Contents)
    expect(file_Name.file_Delete()).to.be.true

  it 'file_Exists' , ->
    ''.file_Exists.assert_Is_Function()
    '.git'          .file_Exists().assert_Is_True()
    './src/index.js'.file_Exists().assert_Is_True()
    './aaa.js'      .file_Exists().assert_Is_False()

  it 'file_Not_Exists' , ->
    ''.file_Not_Exists.assert_Is_Function()
    '.git'      .file_Not_Exists().assert_Is_False()
    './index.js'.file_Not_Exists().assert_Is_True()
    './aaa.js'  .file_Not_Exists().assert_Is_True()

  it 'file_Write',->
    content = (20).random_Letters()
    tmpFile = './src'.fullPath().path_Combine('_temp_file.abcd').assert_File_Not_Exists()
                                .file_Write(content)
    tmpFile.assert_File_Exists()
           .file_Contents().assert_Is(content)
    tmpFile.file_Delete().assert_Is_True()
    
  it 'files' , ->
    expect(''.files).to.be.an('function')
    files = './'.files().filter (file) -> file isnt '.DS_Store'.realPath()
    expectedFiles = (file.realPath() for file in '.gitignore,.travis.yml,LICENSE,README.md,package.json'.split(','))
    files.assert_Contains(expectedFiles)
    expect('./'.files('.yml' )).to.deep.equal(['.travis.yml'.realPath()])
    expect('./'.files('.json')).to.deep.equal(['package.json'.realPath()])

  it 'files_Recursive' , ->
    ''.files_Recursive.assert_Is_Function()
    './src'.files_Recursive().assert_Size_Is_Bigger_Than(9)
                             .assert_Contains('./src/fs.coffee'.fullPath())
    tmpFile = './src'.fullPath().path_Combine('_temp_file.abcd').file_Write((20).random_Letters())
    './src'.files_Recursive('.abcd').assert_Size_Is(1)
                                    .first().assert_Is(tmpFile)
    tmpFile.file_Delete().assert_Is_True()

  it 'folders' , ->
    expect(''.folders).to.be.an('function')
    folders = (folder for folder in './'.folders() when folder.not_Contains('.c9'))             #handle scenario when we coded inside Cloud9 IDE 
    expectedFolders = (folder.realPath() for folder in '.git,src,test'.split(','))
    folders.assert_Contains(expectedFolders)

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

  it 'saveAs', ->
    file_Name  = '_tmp_file_'  .add_Random_String(5)
    file_Value = 'value'.add_Random_String(5)

    expect(file_Name.exists()          ).to.be.false
    expect(file_Value.saveAs(file_Name)).to.be.true
    expect(file_Name.exists()          ).to.be.true
    expect(file_Name.file_Delete()     ).to.be.true

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
        