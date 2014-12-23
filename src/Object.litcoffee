back to [main](fluent.html)

These Object prototypes have to be written using Object.defineProperty so that we can set the
enumerable value to false (otherwise 'for item of xyz' would include these methods)

todo: add check for allready mapped methods.
      once that is done we should be able to add this method safely
```
Object.defineProperty Object.prototype, 'json',
    enumerable  : false,
    writable    : true,
    value: ->
        return JSON.stringify(@)
```


**str**

    Object.defineProperty Object.prototype, 'str',
        enumerable  : false,
        writable    : true,
        value: ->
            return @.toString()


**json_pretty**

    Object.defineProperty Object.prototype, 'json_pretty',
        enumerable  : false,
        writable    : true,
        value: ->
            return JSON.stringify(@,null,'  ')

**json_inspect**

    Object.defineProperty Object.prototype, 'json_inspect',
        enumerable  : false,
        writable    : true,
        value: ->
            return require('util').inspect(@)

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

**call_Function**

    Object.defineProperty Object.prototype, 'call_Function',
        enumerable  : false,
        writable    : true,
        value: (method, params...)->
            callParams = [@]
            callParams.push param for param in params
            return method.apply(null,callParams)

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

