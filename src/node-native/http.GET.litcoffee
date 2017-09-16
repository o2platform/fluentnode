dependencies

    http  = require 'http'
    https = require 'https'
    url   = require 'url'
    Server = http.Server

settings

    global.__fluentnode ?= {}
    global.__fluentnode.http ?= {}
    using global.__fluentnode.http, ->
      @.HTTP_GET_TIMEOUT = 500
      @.HTTP_GET_DELAY   = 10

@.**http_GET** (callback)

Makes a GET request to @ and callback with (error, data, res)


    String::http_GET = (callback) ->
      url = url.parse(@._str())
      engine = if url.protocol is 'https:' then https else http
      req = engine.get @._str(), (res) ->
        data = '';
        res.on 'data', (chunk) -> data += chunk
        res.on 'end' , (     ) -> callback null, data, res

      req.on   'error',(err  ) ->
        if callback
          callback err, null, null
      req

@.**http_GET** (callback)

Makes a GET request to @ and callback with data (i.e. string representation of requested url)

    String::GET = (callback) ->
      @.http_GET (error, data, res)-> callback(data, error)


@.**GET_Json**

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