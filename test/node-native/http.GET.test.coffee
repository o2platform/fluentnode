require('../../src/fluentnode')

http = require 'http'

describe '| http.GET',->
  test_Port = 45566 + Math.floor((Math.random() * 100) + 1)
  test_Ip   = '127.0.0.1'
  test_Data = 'hello from web'
  url       = "http://#{test_Ip}:#{test_Port}"
  bad_Url   = 'http://aaaa.cccc.aaaa.dddd'
  server    = null

  before (done)->
    server = http.createServer(null)
    server.listen_OnPort_Saying test_Port, test_Data, ()=>
      global.__fluentnode.http.HTTP_GET_TIMEOUT = 30
      done()

  after (done)->
    server.close_And_Destroy_Sockets ()->
      global.__fluentnode.http.HTTP_GET_TIMEOUT = 500
      done()

  it 'GET_Json, json_GET', (done)->
    ''.json_GET.assert_Is ''.GET_Json
    data = { a : 42}
    server.respond_With_Object_As_Json data
    url.json_GET (json)->
      json  .assert_Is data
      json.a.assert_Is 42
      done()

  it 'json_GET (bad url)', ->
    bad_Url.GET_Json (json)->
      json.assert_Is {}

  it 'json_GET_With_Timeout', (done)->
    data = { a : 42}
    server.respond_With_Object_As_Json data
    url.json_GET_With_Timeout (data)->
      data.assert_Is data
      done()

  it 'json_GET_With_Timeout (bad url)', (done)->
    bad_Url.json_GET_With_Timeout (data)->
      data.assert_Is {}
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
    (-> url.append(1).http_GET()).assert_Throws  (error)->
      error.message.assert_Contains "port should be >= 0 and < 65536: "
      done()

  it 'http_GET_Wait_For_Null', (done)->
    url.http_GET_Wait_For_Null (err)->
      assert_Is_Null err
      done()
    20.wait ->
      server.respond_With_String_As_Text null

  it 'http_GET_Wait_For_Null (no null is returned from server)', (done)->
    server.respond_With_String_As_Text '123'

    attempts = ~~(global.__fluentnode.http.HTTP_GET_TIMEOUT / global.__fluentnode.http.HTTP_GET_DELAY)

    check = (err)->
      err.message.assert_Is "[http_GET_Wait_For_Null] never got a null from server #{url} after #{attempts} attempts"
      done()
    url.http_GET_Wait_For_Null check, attempts

  it 'http_GET_With_Timeout', (done)->
    value = 'asd'.add_5_Random_Letters()
    server.respond_With_String_As_Text null
    url.http_GET_With_Timeout (data)->
      data.assert_Is value
      done()
    20.wait ->
      server.respond_With_String_As_Text value

  it 'http_GET_With_Timeout (null is always returned from server)', (done)->
    server.respond_With_String_As_Text null
    url.http_GET_With_Timeout (data)->
      assert_Is_Null data
      done()