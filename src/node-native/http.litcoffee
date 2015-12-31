
dependencies

    http  = require('http')
    https = require('https');
    url   = require('url')
    Server = http.Server

    String::http_Status = (callback) ->
      http.get @.str(), (res) ->
        callback res.statusCode

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
