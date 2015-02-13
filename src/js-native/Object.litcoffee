These Object prototypes have to be written using Object.defineProperty so that we can set the
enumerable value to false (otherwise 'for item of xyz' would include these methods)

todo: add check for already mapped methods. once that is done we should be able to add this method safely


@.**str**

Returns the ```toString``` result of the @ object

    Object.defineProperty Object.prototype, 'str',
        enumerable  : false,
        writable    : true,
        value: ->
            return @.toString()


@.**json_Str**

Returns the JSON.stringify of the @ object

Note: Returns '' if there is a error stringifying @

    Object.defineProperty Object.prototype, 'json_Str',
        enumerable  : false,
        writable    : true,
        value: ->
            try
              JSON.stringify(@)
            catch
              ''


@.**json_Pretty**

twin method: json_pretty (legacy)

    Object.defineProperty Object.prototype, 'json_Pretty',
        enumerable  : false,
        writable    : true,
        value: ->
            try
              JSON.stringify(@,null,'  ')
            catch
              ''

    Object.defineProperty Object.prototype, 'json_pretty',enumerable  : false, writable    : true, value: Object::json_Pretty


**json_Inspect**

Returns a json representation of @ (using require('util').inspect which supports recursive objects)

Note: Returns '' if there is a error processing @

twin method: json_inspect (legacy)

    Object.defineProperty Object.prototype, 'json_Inspect',
        enumerable  : false,
        writable    : true,
        value: ->
            require('util').inspect(@)

    Object.defineProperty Object.prototype, 'json_inspect',enumerable  : false, writable    : true, value: Object::json_Inspect

**keys**

    Object.defineProperty Object.prototype, 'keys',
        enumerable  : false,
        writable    : true,
        value: ->
            return (key for own key of @)

**keys_All**

    Object.defineProperty Object.prototype, 'keys_All',
        enumerable  : false,
        writable    : true,
        value: ->
            return (key for key of @)


**values**

    Object.defineProperty Object.prototype, 'values',
        enumerable  : false,
        writable    : true,
        value: ->
            return (@[key] for own key of @)

@.**call_Function**

    Object.defineProperty Object.prototype, 'call_Function',
        enumerable  : false,
        writable    : true,
        value: (method, params...)->
            callParams = [@]
            callParams.push param for param in params
            return method.apply(null,callParams)


@.**load_Json** target

Note: returns {} if there is an error parsing @.file_Contents().
Use **json_Valid** to check for valid json content

    Object.defineProperty Object.prototype, 'load_Json',
        enumerable  : false,
        writable    : true,
        value: ()->
            try
              JSON.parse(@.file_Contents())
            catch
              {}


@.save_Json target

Note: thows exception if there is a problem parsing json

    Object.defineProperty Object.prototype, 'save_Json',
        enumerable  : false,
        writable    : true,
        value: (target)->
            data = JSON.stringify(@,null,'  ')
            return data.saveAs(target)

**repl_Me**

    Object.defineProperty Object.prototype, 'repl_Me',
        enumerable  : false,
        writable    : true,
        value: (onExit)->
            repl = require('repl')
            replServer = repl.start {prompt: '[fluentnode] repl> '}
            replServer.context.that = @
            replServer.context.replServer = replServer
            replServer.on 'exit', ->
              onExit()
            replServer

---
back to [index](index.html)
