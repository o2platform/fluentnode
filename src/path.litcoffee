    path = require('path')

    String::path_Combine         = (pathToAppend) -> if pathToAppend then path.join(@.toString(), pathToAppend) else @.toString()
    String::file_Dir_Name        = ()             -> path.dirname @
    String::file_Extension       = ()             -> path.extname(@.toString())
    String::file_Name            = ()             -> path.basename @.toString()
    Array::file_Names            = ()             -> file.file_Name() for file in @

    String::append_To_Process_Cwd_Path    = ()    -> process.cwd().path_Combine(@.toString())
    String::file_Name_Without_Extension   = ()    -> path.basename @.toString().replace(@.toString().file_Extension(), "")
    Array:: file_Names_Without_Extension  = ()    -> file.file_Name_Without_Extension() for file in @

    String::file_Parent_Folder = String::file_Dir_Name
    String::parent_Folder      = String::file_Dir_Name

---
back to [index](index.html)