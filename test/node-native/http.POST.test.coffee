require('../../src/fluentnode')

http = require 'http'

describe '| node-native | http.POST',->
  test_Port = 45566 + Math.floor((Math.random() * 100) + 1)
  test_Ip   = '127.0.0.1'
  test_Data = 'hello from web'
  url       = "http://#{test_Ip}:#{test_Port}"
  server    = null
  req_Data  = "aaa=bbb"

  before (done)->
    server = http.createServer(null)
    server.listen_OnPort_Saying test_Port, test_Data, ()=>
      done()

  after (done)->
    server.close_And_Destroy_Sockets ()->
      done()

  it 'http_POST', (done)->
    server.respond_With_Request_Headers()

    req = url.http_POST req_Data, (error, data, res)->
      assert_Is_Null error
      data.json_Parse().assert_Is 'host':"#{test_Ip}:#{test_Port}", 'connection': 'close', 'content-length' : '0'
      res.headers['content-type'].assert_Is 'application/json'
      done()
    req.method.assert_Is 'POST'


  it 'POST', (done)->
    server.respond_With_Request_Headers()
    url.POST req_Data, (data)->
      data.json_Parse().assert_Is 'host':"#{test_Ip}:#{test_Port}", 'connection': 'close', 'content-length' : '0'
      done()