require('../../src/fluentnode')

http = require 'http'

describe '| node-native | http.Server',->
  test_Port = 45566 + Math.floor((Math.random() * 100) + 1)
  test_Ip   = '127.0.0.1'
  test_Data = 'hello from web'
  url       = "http://#{test_Ip}:#{test_Port}"
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

  it 'global.__fluentnode.settings.http',->
    using global.__fluentnode.http,->
      @.assert_Is_Object()
      @.HTTP_GET_TIMEOUT.assert_Is 500
      @.HTTP_GET_DELAY.assert_Is 10

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
      headers.assert_Is({"host":"127.0.0.1:#{port}","connection":"close"})
      done()


  it 'respond_With_Request_Url', (done)->
    server.respond_With_Request_Url()
    url.append('/aaa/bbbb').GET_Json (url) ->
      url.assert_Is({"url":"/aaa/bbbb"} )
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