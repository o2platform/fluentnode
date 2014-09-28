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
                                                    get: -> new FluentPath(this.toString()),
                                                    configurable: true
                                                })

String.prototype.pathCombine = (pathToAppend) -> new FluentPath(this.toString()).join(pathToAppend)

module.exports = FluentPath