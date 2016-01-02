require('../../src/fluentnode')

http = require 'http'

describe '| node-native | http',->
  test_Port = 45566 + Math.floor((Math.random() * 100) + 1)
  test_Ip   = '127.0.0.1'
  test_Data = 'hello from web'
  url       = "http://#{test_Ip}:#{test_Port}"
  server    = null

  before (done)->
    server = http.createServer(null)
    server.listen_OnPort_Saying test_Port, test_Data, ()=>
      done()

  after (done)->
    server.close_And_Destroy_Sockets ()->
      done()



  it 'http_Status', (done)->
    url.http_Status (status)->
      status.assert_Is(200)
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

  it 'http_With_Options (bad data)', (done)->
    url.http_With_Options { port: 81 }, (err, data,res)->
      assert_Is_Not_Null(err).code.assert_Is('ECONNREFUSED')
      assert_Is_Null(data)
      assert_Is_Null(res)
      done()

  it 'http_With_Options', (done)->
    server.respond_With_Request_Headers()
    options =
      headers: { 'name' : 'value_'.add_5_Random_Letters() , 'cookie':'abc=123;'}
      method: 'POST'
    req = url.http_With_Options options, (err, data)->
      json = JSON.parse(data)
      expected_Server_Req_Options =
        name            : options.headers.name
        host            : "#{test_Ip}:#{test_Port}"
        connection      :'close'
        cookie          : 'abc=123;'
        'content-length': '0'

      json.assert_Is expected_Server_Req_Options
      done()
    req.method.assert_Is 'POST'
    req._headers.name.assert_Is options.headers.name
    req._headers.cookie.assert_Is options.headers.cookie
    req._headers.host.assert_Is "#{test_Ip}:#{test_Port}"
    req.path.assert_Is '/'