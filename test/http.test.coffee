require('../src/http')
require('../src/Number')

http = require 'http'

describe 'http',->
  test_Port = 45566 + Math.floor((Math.random() * 100) + 1)
  test_Ip   = '127.0.0.1'
  test_Data = 'hello from web'
  url       = "http://#{test_Ip}:#{test_Port}"

  describe 'helper HTTP server methods', ->

    server    = null

    before (done)->
      url.assert_Contains(test_Ip).assert_Contains(test_Port)
      server = http.createServer(null)
      server.listen_OnPort_Saying test_Port, test_Data, ()=>
        done()

    after (done)->
      server.close_And_Destroy_Sockets ()->
        assert_Is_Null(server._handle)
        assert_Is_Null(server.address())
        server._sockets.keys().assert_Is_Array().assert_Size_Is(0)
        done()

    it 'createServer_OnPort_Saying',()->
        server.listen_OnPort_Saying.assert_Is_Function()
        server                  .assert_Instance_Of(http.Server)
        server._handle          .assert_Is_Not_Null()
        server.address().port   .assert_Is test_Port
        server.address().address.assert_Is test_Ip
        server._sockets         .assert_Is_Object()
        server._sockets.keys()  .assert_Is_Array().assert_Size_Is(0)
        server._socket_Count    .assert_Is(0)

    it 'respond_With_Request_Headers', (done)->
      server.respond_With_Request_Headers()
      port = url.split(':').last()
      url.GET_Json (headers) ->
        headers.assert_Is({"host":"127.0.0.1:#{port}","connection":"keep-alive"})
        done()

    it 'respond_With_Object_As_Json', (done)->
      server.respond_With_Object_As_Json.assert_Is_Function()
      test_Object = { a : 123 , b : 456}
      server.respond_With_Object_As_Json(test_Object)
      url.GET (json) ->
        json.assert_Is(JSON.stringify(test_Object))
        test_Object.a='abc'
        url.GET_Json (value) ->
          value.a.assert_Is('abc')
          value.b.assert_Is(456)
          done()

    it 'respond_With_String_As_Text', (done)->
      text = (20).random_Letters()
      server.respond_With_String_As_Text(text)
      url.GET (value) ->
        value.assert_Is(text)
        server.respond_With_String_As_Text(test_Data)
        url.GET (value) ->
          value.assert_Is(test_Data)
          done()

    it 'respond_With_Request_Object', (done)->
      server.respond_With_Request_Object()
      url.GET (req_Data) ->
        req_Data.assert_Is_String()
        req_Data.assert_Contains("headers: { host: '127.0.0.1:")
                .assert_Contains(['socket:','connection:'])
        done()

  describe 'Making HTTP requests',->

    server = null

    before ->
      server = http.createServer(null)
      server.listen_OnPort_Saying test_Port, test_Data, ()=>

    after (done)->
      server.close_And_Destroy_Sockets ()->
        done()

    it 'GET_Json, json_GET', (done)->
      ''.json_GET.assert_Is ''.GET_Json
      data = { a : 42}
      server.respond_With_Object_As_Json data
      url.json_GET (json)->
        json  .assert_Is data
        json.a.assert_Is 42
        done()

    it 'http_Status', (done)->
      url.http_Status (status)->
        status.assert_Is(200)
        done()

    it 'http_GET' , (done)->
      server.respond_With_String_As_Text test_Data
      req = url.http_GET (err, data, res)->
        assert_Is_Null(err)
        data.assert_Is_String()
        req.assert_Instance_Of(http.ClientRequest)
        res.assert_Instance_Of(http.IncomingMessage)
        data.assert_Is(test_Data)
        done()

    it 'http_GET bad port)' , (done)->
      url.append(1).http_GET (err, data, res)->
        assert_Is_Not_Null(err).code.assert_Is('ECONNREFUSED')
        assert_Is_Null(data)
        assert_Is_Null(res)
        done()

    it 'http_With_Options', (done)->
      server.respond_With_Request_Headers()
      options = {
                  headers: { 'name' : 'value_'.add_5_Random_Letters() , 'cookie':'abc=123;'}
                }
      url.http_With_Options options, (err, data)->
        json = JSON.parse(data)
        json.name.assert_Is(options.headers.name)
        json.cookie.assert_Is('abc=123;')
        done()

    it 'http_GET_Wait_For_Null', (done)->
      url.http_GET_Wait_For_Null (err)->
        assert_Is_Null err
        done()
      20.wait ->
        server.respond_With_String_As_Text null

    it 'http_GET_Wait_For_Null (no null is returned from server)', (done)->
      server.respond_With_String_As_Text '123'
      attempts = 3
      check = (err)->
        err.message.assert_Is "[http_GET_Wait_For_Null] never got a null from server #{url} after #{attempts} attempts"
        done()
      url.http_GET_Wait_For_Null check, attempts



    it 'http_With_Options (bad data)', (done)->
      url.http_With_Options { port: 81 }, (err, data,res)->
        assert_Is_Not_Null(err).code.assert_Is('ECONNREFUSED')
        assert_Is_Null(data)
        assert_Is_Null(res)
        done()
