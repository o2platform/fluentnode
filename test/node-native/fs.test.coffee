#back to [main](fluent.html)

require('../../src/fluentnode')

expect     = require('chai').expect

describe 'fs',->

  it 'create_Parent_Folder', ->
    './aaa/abc.txt'.create_Parent_Folder().assert_Is './aaa/abc.txt'
    './aaa'.assert_Folder_Exists()
    "./aaa".delete_Folder().assert_True()

  it 'folder_Create and folder_Delete' , ->               # tests the String's folder_Create and folder_Delete methods
    ''.folder_Create.assert_Is_Function()                 # checks if String::folder_Create exists
    ''.folder_Delete.assert_Is_Function()                 # checks if String::folder_Delete exists
    tmpDir = "./".temp_Name_In_Folder()                   # get a temp folder name in the folder provided as string
    tmpDir.assert_Folder_Not_Exists()                     # asserts that folder doesn't exist
          .folder_Create().assert_Is tmpDir.realPath()    # creates folder and confirms that the return value is the full path to the folder
    tmpDir.assert_Folder_Exists()                         # assert that folders exists
          .folder_Delete().assert_Is_True()               # deletes folder (confirming OK result from delete action)
    tmpDir.assert_Folder_Not_Exists()                     # asserts that folder doesn't exist

    ''.folder_Delete.assert_Is ''.delete_Folder

  it 'folder_Create (and its parent)', ->
    tmpDir  = "./".temp_Name_In_Folder()
    tmpDir2 = tmpDir.path_Combine('aaa')
    tmpDir2.create_Dir().assert_That_Folder_Exists()
    tmpDir.folder_Delete_Recursive().assert_Is_True()

  it 'folder_Delete_Recursive' , ->
    tmpDir = "./"   .temp_Name_In_Folder().folder_Create()
    tmpFile = tmpDir.temp_Name_In_Folder().file_Create()
    tmpDir.folder_Delete_Recursive().assert_Is_True()

  it 'file_Create and file_Delete',->
    tmpName = '.'.temp_Name_In_Folder()
    tmpName.file_Create().assert_Is(tmpName)
    tmpName.exists()     .assert_True()
    tmpName.file_Delete().assert_True()
    tmpName.exists()     .assert_False()

  it 'file_Copy' , ->
    file1 = '.'.temp_Name_In_Folder()
    file2 = '.'.temp_Name_In_Folder()
    file1.file_Create().assert_Is(file1)
    file1.assert_File_Exists()
    file1.file_Copy(file2)
    file2.assert_File_Exists()

    folder         = '_tmp_file_Copy'.folder_Create()
    file_In_Folder = file1.file_Copy(folder)
    file_In_Folder.assert_File_Exists()

    assert_Is_Null('aaa'.file_Copy('bbb'))
    assert_Is_Null(file1.file_Copy(null))

    folder.folder_Delete_Recursive().assert_True()
    file1.file_Delete().assert_True()
    file2.file_Delete().assert_True()

  it 'file_Contents' , ->
    ''.file_Contents.assert_Is_Function()
    file_Name     = '_temp_name_'.add_Random_String(5)
    file_Contents = 'value_'.add_Random_String(5)
    (file_Name.file_Exists().assert_Is_False())
    file_Contents.save_As(file_Name)
    file_Name.file_Exists().assert_Is_True()
    file_Name.file_Contents().assert_Is(file_Contents)
    file_Name.file_Delete().assert_Is_True()

  it 'file_Exists' , ->
    ''.file_Exists.assert_Is_Function()
    '.git'               .file_Exists().assert_Is_True()
    './src/fluentnode.js'.file_Exists().assert_Is_True()
    './aaa.js'           .file_Exists().assert_Is_False()
    './aaa.js'           .file_Exists().assert_Is_False()

  it 'file_Lines', ->
    "".file_Lines().assert_Is []
    tmp_File = "aaaa\nbbbb".save_As('_tmp_file_Lines')
    tmp_File.file_Lines().assert_Is ['aaaa','bbbb']
    tmp_File.assert_File_Deleted()

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

  it 'files_And_Folders',->
    ''.files_And_Folders.assert_Is_Function()
    files = './'.files_And_Folders();
    files.assert_Contains '.git'      .realPath()
         .assert_Contains '.gitignore'.realPath()
         .assert_Not_Contains '.aaaaa'.realPath()

    'aaaa'.files_And_Folders().assert_Is([])

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
                             .assert_Contains('./src/node-native/fs.litcoffee'.fullPath())
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

  it 'is_Not_Folder',->
    "".add_5_Random_Letters().is_Not_Folder().assert_Is_True()

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

  it 'save_As', ->
    file_Name  = '_tmp_file_'  .add_Random_String(5)
    file_Value1 = 'value'.add_Random_String(5)
    file_Value2 = 'value'.add_Random_String(5)

    file_Name.exists().assert_Is_False()

    file_Value1.save_As(file_Name).assert_Is(file_Name.real_Path()).assert_File_Exists()
    file_Name.exists()            .assert_Is_True()
    file_Name.file_Contents()     .assert_Is    (file_Value1)
    file_Name.file_Contents()     .assert_Is_Not(file_Value2)

    file_Value2.save_As(file_Name).assert_Is(file_Name.real_Path()).assert_File_Exists()
    file_Name.exists()            .assert_Is_True()
    file_Name.file_Contents()     .assert_Is_Not(file_Value1)
    file_Name.file_Contents()     .assert_Is    (file_Value2)

    file_Name.file_Delete()       .assert_Is_True()

    ''.save_As.assert_Is ''.saveAs

  it 'temp_File',->
    value = "abc".add_5_Letters()
    './'.temp_File(value).assert_File_Exists()
                         .assert_File_Contents(value)
                         .assert_File_Deleted()

    assert_Is_Null 'aaaaaa'.temp_File()

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
