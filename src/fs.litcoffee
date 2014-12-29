dependencies

    require './path'
    fs = require('fs')

@.**folder_Create**

Creates a folder on @, with checks to create parent folders recusively (i.e. it will also create all parents up until it finds a valid directory)

    String::folder_Create    = ->
      target = @.valueOf()
      if target.folder_Not_Exists()           # only do anyhing id the folder doesn't exist
        target.parent_Folder()                # check if the parent folder exists
              .folder_Create()
        fs.mkdirSync(target)                  # use node fs.mkdirSync to creat the folder
      return target.realPath()                # return full normalized path to target folder

@.**folder_Delete**

    String::folder_Delete       = ->
                                    folder = @.toString()
                                    if fs.existsSync(folder) then fs.rmdirSync(folder)
                                    return folder.not_Exists()

    String::folder_Delete_Recursive = ->
                                    folder = @.toString()
                                    if folder.exists()
                                      for file in folder.files()
                                        file.file_Delete()
                                      for subFolder in folder.folders()
                                        subFolder.folder_Delete_Recursive()
                                      folder.folder_Delete()
                                    return folder.not_Exists()


    String::file_Create         = ->
                                      path = @.toString()
                                      if path.not_Exists()
                                          fs.writeFileSync(path,'')
                                      return path.realPath();

    String::file_Delete         = ->
                                      file = @.toString().realPath()
                                      return true if not file
                                      fs.unlinkSync file
                                      return file.file_Not_Exists()

    String::file_Contents        = ->
                                      file = @.toString().realPath()
                                      return null if not file
                                      return fs.readFileSync(file,"utf8")


    String::file_Exists         = ->
                                      file = @.toString()
                                      if(file)
                                        return fs.existsSync  file
                                      return false
    String::file_Write  = (content)->
                                      content.saveAs(@.str())
                                      @

    String::file_Not_Exists     = ->  (fs.existsSync @.toString()) == false
    String::files_and_Folders   = ->
                                      path = @.toString()
                                      try
                                        path.path_Combine(item).realPath() for item in fs.readdirSync path
                                      catch
                                        []

    String::files               = (extension)->
                                      files = (item for item in @.files_and_Folders() when item.is_File())
                                      if extension
                                        return (file for file in files when file.file_Extension() is extension)
                                      return files
    String::files_Recursive     = (extension)->
                                      files = []
                                      for item in @.str().files_and_Folders()
                                        if (item.is_Folder())
                                          files = files.concat(item.files_Recursive(extension))
                                        else
                                          if (not extension or item.file_Extension() is extension)
                                            files.push(item)
                                      return files

    String::folders             = ->  item for item in @.files_and_Folders() when item.is_Folder()

@.**is_Folder**

Returns true is @ is a folder

    String::is_Folder = ->
      try
        fs.lstatSync(@.toString()).isDirectory()
      catch
        false

@.**is_Not_Folder**

Returns true if @ is not a folder

    String::is_Not_Folder = ->
      @.is_Folder() is false

    String::is_File             = ->  try fs.lstatSync(@.toString()).isFile()      catch then false

    String::realPath            = ->  try fs.realpathSync @.toString() catch then null
    String::temp_Name_In_Folder = ->  @.toString().realPath().path_Combine("_tmp_".add_Random_String(10))

    String::saveAs              = (targetFile) ->
                                      return false if targetFile is null
                                      contents = @.toString()
                                      if (targetFile.exists())
                                        targetFile.file_Delete()
                                      fs.writeFileSync(targetFile,contents)
                                      return targetFile.exists()


    #String::saveAs

    String::exists              = String::file_Exists
    String::create_Dir          = String::folder_Create
    String::delete_File         = String::file_Delete
    String::delete_Folder       = String::folder_Delete
    String::folder_Exists       = String::is_Folder
    String::folder_Not_Exists   = String::is_Not_Folder
    String::fullPath            = String::realPath
    String::is_Directory        = String::is_Folder
    String::touch               = String::file_Create
    String::not_Exists          = String::file_Not_Exists


---
back to [index](index.html)