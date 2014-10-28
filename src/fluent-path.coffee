path = require('path')

String::fluentpath = ->
    return "FluentPath is here, see https://github.com/o2platform/FluentNode for more details"

class FluentPath
    constructor: (string)->
                            @string       = string
                            @showDebugMsg = false
    
    toString: => @string

    join    : (pathToAppend) =>
                if(pathToAppend)
                    path.join(@string, pathToAppend)
                else
                    @string
 #               try
 #                   path.join(@string, pathToAppend)
 #               catch error
 #                   if(@showDebugMsg)
 #                       console.log "[fluentpath][join] #{error}"
 #                   null
    


Object.defineProperty(String.prototype, 'path', {
                                                    get: -> new FluentPath(this.toString())
                                                    configurable: true
                                                })

String::path_Combine         = (pathToAppend) -> new FluentPath(this.toString()).join(pathToAppend)
String::file_Extension       = ()             -> path.extname(@.toString())
String::file_Name            = ()             -> path.basename @.toString()
Array::file_Names            = ()             -> file.file_Name() for file in @

String::file_Name_Without_Extension  = ()     -> path.basename @.toString().replace(@.toString().file_Extension(), "")
Array::file_Names_Without_Extension  = ()     -> file.file_Name_Without_Extension() for file in @

module.exports = FluentPath