    path = require('path')

@.**path_Combine**

    String::path_Combine = (pathToAppend) ->
      if pathToAppend then path.join(@.toString(), pathToAppend) else @.toString()

@.**file_Dir_Name**

twin methods: file_Parent_Folder, parent_Folder

    String::file_Dir_Name  = () ->
      path.dirname @

    String::file_Parent_Folder = String::file_Dir_Name
    String::parent_Folder      = String::file_Dir_Name


@.**file_Extension**

    String::file_Extension = () ->
      path.extname(@.toString())

@.**file_Name**

    String::file_Name = () ->
      path.basename @.toString()

@.**file_Names**

    Array::file_Names = () ->
      file.file_Name() for file in @

@.**append_To_Process_Cwd_Path**

    String::append_To_Process_Cwd_Path  = () ->
      process.cwd().path_Combine(@.toString())

@.**file_Name_Without_Extension**

    String::file_Name_Without_Extension  = () ->
      path.basename @.toString()
                     .replace(@.toString().file_Extension(), "")

@.**file_Names_Without_Extension**

    Array:: file_Names_Without_Extension  = () ->
      file.file_Name_Without_Extension() for file in @

@.**folder_Name**

Returns the name of the current folder (which is the right-most segment of a path)

If you want the full path, use the **parent_Folder** method

    String::folder_Name = ()->
      @.valueOf().file_Name()

---
back to [index](index.html)
