#back to [main](fluent.html)

require('../src/assert/assert_Array')
require('../src/String')
require('../src/path')
require('../src/fs')
expect     = require('chai').expect

describe 'fs',->

  it 'folder_Create and folder_Delete' , ->               # tests the String's folder_Create and folder_Delete methods
    "".folder_Create.assert_Is_Function()                 # checks if String::folder_Create exists
    "".folder_Delete.assert_Is_Function()                 # checks if String::folder_Delete exists
    tmpDir = "./".temp_Name_In_Folder()                   # get a temp folder name in the folder provided as string
    tmpDir.assert_Folder_Not_Exists()                     # asserts that folder doesn't exist
          .folder_Create().assert_Is tmpDir.realPath()    # creates folder and confirms that the return value is the full path to the folder
    tmpDir.assert_Folder_Exists()                         # assert that folders exists
          .folder_Delete().assert_Is_True()               # deletes folder (confirming OK result from delete action)
    tmpDir.assert_Folder_Not_Exists()                     # asserts that folder doesn't exist

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
    ''.file_Contents.assert_Is_Function()
    file_Name     = '_temp_name_'.add_Random_String(5)
    file_Contents = 'value_'.add_Random_String(5)
    (file_Name.file_Exists().assert_Is_False())
    file_Contents.saveAs(file_Name)
    file_Name.file_Exists().assert_Is_True()
    file_Name.file_Contents().assert_Is(file_Contents)
    file_Name.file_Delete().assert_Is_True()

  it 'file_Exists' , ->
    ''.file_Exists.assert_Is_Function()
    '.git'          .file_Exists().assert_Is_True()
    './src/_register.js'.file_Exists().assert_Is_True()
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
    ''.files.assert_Is_Function()
    files = './'.files().filter (file) -> file isnt '.DS_Store'.realPath()
    expectedFiles = (file.realPath() for file in '.gitignore,.travis.yml,LICENSE,README.md,package.json'.split(','))
    files.assert_Contains(expectedFiles)
    './'.files('.yml' ).assert_Is(['.travis.yml'.realPath()])
    './'.files('.json').assert_Is(['package.json'.realPath()])

  it 'files_Recursive' , ->
    ''.files_Recursive.assert_Is_Function()
    './src'.files_Recursive().assert_Size_Is_Bigger_Than(9)
                             .assert_Contains('./src/fs.litcoffee'.fullPath())
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
        