dependencies

    http  = require('http')
    https = require('https');
    url   = require('url')
    Server = http.Server

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
