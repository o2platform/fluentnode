require './fluent-path'

fs = require('fs')

String::folder_Create    = ->
                              folder = @.toString()
                              if fs.existsSync(folder)
                                return folder
                              fs.mkdirSync(folder)
                              return folder.realPath()

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
String::file_Not_Exists     = ->  (fs.existsSync @.toString()) == false
String::files_and_Folders   = ->
                                  path = @.toString()
                                  path.path_Combine(item).realPath() for item in fs.readdirSync path

String::files               = (extension)->
                                  files = (item for item in @.files_and_Folders() when item.is_File())
                                  if extension
                                    return (file for file in files when file.path_Extension() is extension)
                                  return files

String::folders             = ->  item for item in @.files_and_Folders() when item.is_Folder()

String::is_Folder           = ->  try fs.lstatSync(@.toString()).isDirectory() catch then false
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
String::is_Directory        = String::is_Folder
String::touch               = String::file_Create
String::not_Exists          = String::file_Not_Exists