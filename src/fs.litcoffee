dependencies

    require './path'
    fs = require('fs')


@.**create_Parent_Folder**

Creates the parent folder of the current @

Useful when creating a file in a folder that might not exist

Note that ```folder_Create()``` will create multiple parent folders (if needed)

Returns @

    String::create_Parent_Folder = ->
      @.valueOf().parent_Folder()
                 .folder_Create()
      @

@.**folder_Create**

Creates a folder on @, with checks to create parent folders recusively (i.e. it will also create all parents up until it finds a valid directory)

    String::folder_Create = ->
      target = @.valueOf()
      if target.folder_Not_Exists()           # only do anyhing id the folder doesn't exist
        target.parent_Folder()                # check if the parent folder exists
              .folder_Create()
        fs.mkdirSync(target)                  # use node fs.mkdirSync to creat the folder
      return target.realPath()                # return full normalized path to target folder

@.**folder_Delete**

Deletes the @ folder

twin methods: delete_Folder

    String::folder_Delete       = ->
      folder = @.toString()
      if fs.existsSync(folder)
        fs.rmdirSync(folder)
      return folder.not_Exists()

    String::delete_Folder = String::folder_Delete

@.**folder_Delete_Recursive**

Deletes the folder @ recursively (ie. all files and all folders inside it)

    String::folder_Delete_Recursive = ->
                                    folder = @.toString()
                                    if folder.exists()
                                      for file in folder.files()
                                        file.file_Delete()
                                      for subFolder in folder.folders()
                                        subFolder.folder_Delete_Recursive()
                                      folder.folder_Delete()
                                    return folder.not_Exists()

@.**file_Copy** target

Copy ```@``` file to ```target```

if target is an existing folder, the file will be copied into that folder with the filename of ```@```

returns ```target``` path

    String::file_Copy = (target)->
      if not (target)
        return null
      if (@.valueOf().file_Not_Exists())
        return null;

      if target.folder_Exists()
        target = target.path_Combine(@.valueOf().file_Name())
      else
        target.parent_Folder().folder_Create()

      content = fs.readFileSync(@.valueOf());
      fs.writeFileSync(target, content)

      target

@.**file_Create**

Creates and empty file at @

    String::file_Create         = ->
                                      path = @.toString()
                                      if path.not_Exists()
                                          fs.writeFileSync(path,'')
                                      return path.realPath();

@.**File_Delete**

Deletes @ file

    String::file_Delete = ->
      file = @.toString().realPath()
      return true if not file
      fs.unlinkSync file
      return file.file_Not_Exists()


@.**file_Contents**

Returns the ascii contents (utf8) of the @ file or null if there is an error loading the file (for example if the file
does not exist or is a directory

    String::file_Contents = ->
      file = @.valueOf().realPath()
      try
        return fs.readFileSync(file,"utf8")
      catch
        null

@.**file_Exists**

Returns true if @ is a file and it exists

twin methods: exists

    String::file_Exists = ->
      return fs.existsSync  @.valueOf()

    String::exists = String::file_Exists

@.**file_Lines**

Returns an array of the file contents splitted by lines (or empty if there was no content)

    String::file_Lines = ->
      file_Contents = @.file_Contents()
      if file_Contents isnt null
        file_Contents.lines()
      else
        []

@.**file_Write** content

Writes ```content``` as file @


    String::file_Write  = (content)->
      content.saveAs(@.str())
      @

@.**file_Not_Exists**

Returns true if @ is not a file

    String::file_Not_Exists     = ->
      (fs.existsSync @.valueOf()) == false


@.**files_and_Folders**

returns a list of files and folders from the folder @

    String::files_And_Folders   = ->
                                      path = @.valueOf()
                                      try
                                        path.path_Combine(item).realPath() for item in fs.readdirSync path
                                      catch
                                        []

    String::files               = (extension)->
                                      files = (item for item in @.files_And_Folders() when item.is_File())
                                      if extension
                                        return (file for file in files when file.file_Extension() is extension)
                                      return files
    String::files_Recursive     = (extension)->
                                      files = []
                                      for item in @.str().files_And_Folders()
                                        if (item.is_Folder())
                                          files = files.concat(item.files_Recursive(extension))
                                        else
                                          if (not extension or item.file_Extension() is extension)
                                            files.push(item)
                                      return files

    String::folders             = ->  item for item in @.files_And_Folders() when item.is_Folder()

@.**is_Folder**

Returns true is @ is a folder

    String::is_Folder = ->
      try
        fs.lstatSync(@.valueOf()).isDirectory()
      catch
        false

@.**is_Not_Folder**

Returns true if @ is not a folder

    String::is_Not_Folder = ->
      @.is_Folder() is false

    String::is_File             = ->  try fs.lstatSync(@.valueOf()).isFile()      catch then false

    String::realPath            = ->  try fs.realpathSync @.valueOf() catch then null

@.**temp_File** contents

Creates a file in ```@``` folder with a temp name and with ```contents```

If ```contents``` is empty, the file will be created with ''
If ```@``` is not a folder, no file will be created and null is returned

If all goes well, the retuned value is the full path to the temp file created

    String::temp_File = (contents)->
      if @.is_Folder()
        @.temp_Name_In_Folder()
         .file_Write(contents || '')
         .valueOf()
      else
        return null

    String::temp_Name_In_Folder = ->  @.valueOf().realPath().path_Combine("_tmp_".add_Random_String(10))

@.**save_As** targetFile

Sync saves @ into ```targetFile```. If ```targetFile``` exists, it is deleted first, before save is done

Returns full path to saved file

twin method: saveAs (legacy)

    String::save_As              = (targetFile) ->
                                      return false if targetFile is null
                                      contents = @.valueOf()
                                      if (targetFile.exists())
                                        targetFile.file_Delete()
                                      fs.writeFileSync(targetFile,contents)
                                      if targetFile.real_Path().exists()
                                        return targetFile.real_Path()


    String::saveAs = String::save_As


Other twin methods to add to correct location


    String::create_Dir          = String::folder_Create
    String::delete_File         = String::file_Delete
    String::folder_Exists       = String::is_Folder
    String::folder_Not_Exists   = String::is_Not_Folder
    String::fullPath            = String::realPath
    String::real_Path           = String::realPath
    String::is_Directory        = String::is_Folder
    String::touch               = String::file_Create
    String::not_Exists          = String::file_Not_Exists

---
back to [index](index.html)
