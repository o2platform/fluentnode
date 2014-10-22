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
                                path = @.toString()
                                if path.exists()
                                  for file in path.files()
                                    curPath = path.path_Combine(file)
                                    if curPath.is_Folder()
                                      curPath.folder_Delete_Recursive()
                                    else
                                      curPath.file_Delete()
                                  fs.rmdirSync(path);

                                return path.not_Exists()

String::file_Create         = ->
                                  path = @.toString()
                                  if path.not_Exists()
                                      fs.writeFileSync(path,'')
                                  return path.realPath();

String::file_Delete         = ->
                                  file = @.toString().realPath()
                                  fs.unlinkSync file
                                  return file.file_Not_Exists()

String::file_Exists         = ->  fs.existsSync  @.toString()
String::file_Not_Exists     = ->  (fs.existsSync @.toString()) == false
String::files               = ->  fs.readdirSync @.toString()

String::is_Folder           = ->  try fs.lstatSync(@.toString()).isDirectory() catch then false
String::is_File             = ->  try fs.lstatSync(@.toString()).isFile()      catch then false

String::realPath            = ->  try fs.realpathSync @.toString() catch then null
String::temp_Name_In_Folder = ->  @.toString().realPath().path_Combine("_tmp_".add_Random_String(10))

#String::saveAs     

String::exists              = String::file_Exists
String::create_Dir          = String::folder_Create
String::folder_Exists       = String::is_Folder
String::is_Directory        = String::is_Folder
String::touch               = String::file_Create
String::not_Exists          = String::file_Not_Exists