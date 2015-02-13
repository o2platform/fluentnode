dependencies

    http  = require('http')
    https = require('https');
    url   = require('url')
    Server = http.Server

settings

    global.__fluentnode ?= {}
    global.__fluentnode.http ?= {}
    using global.__fluentnode.http, ->
      @.HTTP_GET_TIMEOUT = 500
      @.HTTP_GET_DELAY   = 10

**Server::add_Sockets_Close_Suport**

    Server::add_Sockets_Close_Suport = ()->
      #add support for capturing and closing open sockets
      @._sockets = {}
      @._socket_Count = 0;
      @.on 'connection',  (socket)=>
        socket_id = @._socket_Count++
        @._sockets[socket_id] = socket

        socket.on 'close',  ()=>
          delete @._sockets[socket_id];
      @

    Server::close_And_Destroy_Sockets = (callback)->
      if (@._sockets != undefined)                    # if this was set, destroy open sockets
        for socket_Id of @._sockets
            @._sockets[socket_Id].destroy()
            delete @._sockets[socket_Id];
      @.close ->
        callback()

    Server::listen_OnPort_Saying = (port, text, callback)->
      ip = '127.0.0.1'
      @.respond_With_String_As_Text(text)
       .add_Sockets_Close_Suport()
       .listen port, ip, ->
          callback()

    Server::respond_With_Request_Headers = (value)->
      delete @._events.request
      simple_Response = (req, res) ->
        res.writeHead(200, {'Content-Type': 'application/json'})
        res.end(req.headers.json_Str())
      @.addListener('request', simple_Response)
      @

    Server::respond_With_Request_Url = (value)->
      delete @._events.request
      simple_Response = (req, res) ->
        res.writeHead(200, {'Content-Type': 'application/json'})
        data = { url: req.url}
        res.end(data.json_Str())
      @.addListener('request', simple_Response)
      @

    Server::respond_With_String_As_Text = (value)->
      delete @._events.request                                # removes previous listeners
      simple_Response = (req, res) ->
          res.writeHead(200, {'Content-Type': 'text/plain'})
          res.end(value)
      @.addListener('request', simple_Response)
      @

    Server::respond_With_Object_As_Json = (value)->
      delete @._events.request
      json_Response = (req, res) ->
        res.writeHead(200, {'Content-Type': 'application/json'})
        res.end(value.json_Str())
      @.addListener('request', json_Response)
      @

    Server::respond_With_Request_Object = ()->
      delete @._events.request
      json_Response = (req, res) ->
        res.writeHead(200, {'Content-Type': 'application/json'})
        res.end(req.json_Inspect())                           # unfortunatly there doesn't seem to be a way to create a JSON parseable object from req
      @.addListener('request', json_Response)
      @

    String::http_Status = (callback) ->
      http.get @.str(), (res) ->
        callback res.statusCode

    String::http_GET = (callback) ->
      url = url.parse(@.str())
      engine = if url.protocol is 'https:' then https else http
      req = engine.get @.str(), (res) ->
        data = '';
        res.on 'data', (chunk) -> data += chunk
        res.on 'end' , (     ) -> callback null, data, res

      req.on   'error',(err  ) ->
        callback err, null, null
      req

    String::GET = (callback) ->
      @.http_GET (error, data, res)-> callback(data)


@.**GET_Json**
@.**json_GET**

Makes a GET request to @ and JSON parses the html data received

Will throw an error if the returned data is not a valid JSON objec

Twin methods: json_GET

    String::GET_Json = (callback) ->
      @.http_GET (error, data, res)->
        if data
          callback(data.json_Parse())
        else
          callback {}

    String::json_GET = String::GET_Json

@.**json_GET_With_Timeout**

Makes a GET request (with a 500ms wait for valid data),
and JSON parses the html data received

    String::json_GET_With_Timeout = (callback)->
      @.http_GET_With_Timeout (data)->
        if data
          callback data.json_Parse()
        else
          callback {}


@.**http_GET_Wait_For_Null**

Waits until a GET request to @ results null (or empty)

This is a good util method to check when servers go offline

    String::http_GET_Wait_For_Null = (callback)->
      timeout  = global.__fluentnode.http.HTTP_GET_TIMEOUT
      delay    = global.__fluentnode.http.HTTP_GET_DELAY
      attempts = ~~(timeout/delay)
      try_Http_Get = (next) =>
        @.GET (data)  =>
          if data
            next.invoke_In(delay)
          else
            callback(null)
      run_Tests = (count)=>
        if count
          try_Http_Get ()->
            run_Tests(count-1)
        else
          callback new Error("[http_GET_Wait_For_Null] never got a null from server #{@} after #{attempts} attempts")

      run_Tests(attempts)


@.**http_GET_With_Timeout**

Makes a GET request (with a 500ms wait for valid data)

    String::http_GET_With_Timeout = (callback)->
      timeout = global.__fluentnode.http.HTTP_GET_TIMEOUT
      delay   = global.__fluentnode.http.HTTP_GET_DELAY
      attempts = ~~(timeout/delay)
      try_Http_Get = (next) =>
        @.GET (data) =>
          if data
            callback(data)
          else
            (delay).invoke_After(next)
      run_Tests = (count)=>
        if count
          try_Http_Get ()->
            run_Tests(count-1)
        else
          callback null

      run_Tests attempts


    String::http_With_Options = (options, callback) ->
      url = url.parse(@.str())
      engine = if url.protocol is 'https:' then https else http
      options.hostname = options.hostname || url.hostname
      options.port     = options.port     || url.port
      options.path     = options.path     || url.path
      options.method   = options.method   || 'GET'

      req = engine.get options, (res) ->
        data = '';
        res.on 'data', (chunk) -> data += chunk
        res.on 'end' , (     ) -> callback null, data, res

      req.on   'error',(err  ) ->
        callback err, null, null
      req


    ###options =
        hostname: @,
        port: port,
        path: '/',
        method: 'GET'
        console.log @.str()###

---
back to [index](index.html)
